let doc = """
Link User Config.

Usage:
  link_user_config <dotfiles_folder> [<xdg_config_folder>]
  link_user_config -h | --help
  link_user_config --version

Options:
  -h --help     Show this screen
  --version     Show version
"""

import docopt, os, times

let args = docopt(doc, version = "Link User Config 0.1")

proc get(table: Table[string, docopt.Value], key: string,
         default: string): string =
  let val = table[key]
  if val:
    return $val
  else:
    return default

let dest_main = expandFilename expandTilde("~/")
let dest_config = expandFilename expandTilde args.get("<xdg_config_folder>", "~/.config/")
let dotfiles = expandFileName expandTilde($args["<dotfiles_folder>"])

if not existsDir(dotfiles):
  quit "The dotfiles folder provided \"" & dotfiles & "\" is not a valid folder"
if not existsDir(dest_config):
  quit "The destination config folder \"" & dest_config & "\" is not a valid folder"

var backup_folder = ""
proc get_backup_folder() =
  if backup_folder.len == 0:
    backup_folder = dest_config / "__backup_" & format(
      getLocalTime(getTime()), "yyyy-MM-dd'_'HH'h'mm"
    )
    createDir(backup_folder)

let ignore_list = @[
  ".git", ".gitignore",
  ".config",
  ".nimcache",
  "link_user_config",
  "link_user_config.nim",
  "link_user_config.nim.cfg",
  "not_version_controlled"
]

proc create_links(source, destination: string, skip = ignore_list) =
  echo "==  create links from ", source, " to ", destination, "  =="
  for f in walkDir(source, relative=true):
    let dest_file = destination / f.path

    if f.path in skip:
      echo "skipping ", f.path
      continue

    if symlinkExists(dest_file):
      let cur_symlink_path = expandSymlink(dest_file)
      let new_symlink_path = expandFilename(source / f.path)
      if cur_symlink_path == new_symlink_path:
        echo "already good: ", f.path
        continue

    if existsFile(dest_file) or existsDir(dest_file) or
         symlinkExists(dest_file):
      get_backup_folder()
      echo "backing up ", f.path
      moveFile(dest_file, backup_folder / f.path)

    echo "creating symlink from ", source / f.path, " to ", dest_file
    createSymlink(source / f.path, dest_file)

if not existsDir(dotfiles / ".config"):
  echo "The dotfiles folder doesn't contain a .config folder"
else:
  create_links(dotfiles / ".config", dest_config)
create_links(dotfiles, dest_main)
