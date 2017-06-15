#!/usr/bin/env python3

from glob import glob

import os
import datetime

working_dir = os.path.dirname(os.path.realpath(__file__))

def backup(path):
    """Backup a file"""

    now = datetime.datetime.now()

    backup_dir = os.path.join(working_dir, 'backups')
    backup_name = os.path.basename(path) + '.' + now.strftime('%F_%T') + '.bak'
    backup_path = os.path.join(backup_dir, backup_name)

    os.rename(path, backup_path)

def symlink_file(path):
    """Symlink a single dotfile"""

    base_name = os.path.basename(path)
    live_path = os.path.join(os.path.expanduser('~'), base_name)

    if os.path.exists(live_path) and not os.path.islink(live_path):
        print('Backing up existing file ' + base_name + ' ... ', end='')
        backup(path)
        print('DONE')

    if not os.path.islink(live_path):
        print('Symlinking ' + base_name + ' ... ', end='')
        os.symlink(path, live_path)
        print('DONE')

def main():
    """Main execution file"""

    dotfiles = os.path.join(working_dir, 'dotfiles')

    for file in os.listdir(dotfiles):
        symlink_file(os.path.join(dotfiles, file))

if __name__ == '__main__':
    main()
