import os
import shutil
import argparse

def resolve_symlink(path):
    """
    Resolves the symlink chain to the real file or directory.
    """
    symlink_path = os.readlink(path)  # Get the real path of the symlink
    symlink_dir = os.path.dirname(path)
    joined_path = os.path.join(symlink_dir, symlink_path)
    return os.path.normpath(joined_path)

def copy_file_or_directory(source, dest):
    """
    Copies file or directory to the destination, preserving directory structure.
    """
    if os.path.isdir(source):
        shutil.copytree(source, dest, dirs_exist_ok=True)
    else:
        shutil.copy2(source, dest)

def open_file(file_path, output_dir, copy_result_file):
    """
    Reads the file containing paths, resolves symlinks, and copies the source to the 'output' directory.
    """
    with open(file_path, 'r') as file:
        result_file = None
        for line in file:
            line = line.strip()
            if not line:
                continue
            process_path(line, output_dir, copy_result_file, result_file)
        if result_file:
            result_file.close()

def process_path(path, output_dir, copy_result_file, result_file):
    # Resolve symlink to real file/directory
    if not os.path.islink(path):
        return

    real_path = resolve_symlink(path)
    if real_path.startswith('/') and (not real_path.startswith(os.path.abspath('out'))):
        print('Skip copy file:', real_path)
        return

    # Determine the relative path from the original directory
    #relative_path = os.path.relpath(real_path, start=os.path.commonpath([real_path, file_path]))

    # Create the full destination path, preserving the directory structure
    dest_path = os.path.join(output_dir, real_path)

    # Create necessary directories in the output directory
    dest_dir = os.path.dirname(dest_path)
    os.makedirs(dest_dir, exist_ok=True)

    # Copy file or directory to the output directory
    copy_file_or_directory(real_path, dest_path)
    print(f"Copied {real_path} to {dest_path}")

    if not result_file:
        result_file = open(copy_result_file, 'a')
    result_file.write(f'{real_path}\n')

    process_path(real_path, output_dir, copy_result_file, result_file)

if __name__ == "__main__":
    # Setup argument parsing
    parser = argparse.ArgumentParser(description="Resolve symlinks and copy files or directories to an output folder.")
    parser.add_argument("input_file", help="Path to the file containing the list of paths")
    parser.add_argument("output_dir", help="Directory to copy the files or directories to")
    parser.add_argument("copy_result_file", help="File to save the list of copied files or directories")

    # Parse command-line arguments
    args = parser.parse_args()

    # Make sure the output directory exists
    os.makedirs(args.output_dir, exist_ok=True)

    # Process the paths from the input file
    open_file(args.input_file, args.output_dir, args.copy_result_file)

