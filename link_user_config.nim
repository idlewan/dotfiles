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
proc backup(dest_folder, filename: string) =
  # ensure that backup folder is present before copying to it
  if backup_folder.len == 0:
    backup_folder = dest_config / "__backup_" & format(
      getLocalTime(getTime()), "yyyy-MM-dd'_'HH'h'mm"
    )
    createDir(backup_folder)
  echo "backing up ", filename
  moveFile(dest_folder / filename, backup_folder / filename)

let ignore_list = @[
  ".git", ".gitignore",
  ".config",
  "__nimcache__",
  "link_user_config",
  "link_user_config.nim",
  "link_user_config.nim.cfg",
  "machine_specific",
  "not_version_controlled"
]
let partial_configs = @[
  ".moc",
  "filezilla",
  "ranger"
]

proc create_links(source, destination: string, skip = ignore_list) =
  echo "==  create links from ", source, " to ", destination, "  =="
  for f in walkDir(source, relative=true):
    let dest_file = destination / f.path
    var source_file = source / f.path

    if f.path in skip:
      echo "    (skipping ", f.path, ")"
      continue

    if f.path in partial_configs:
      if symlinkExists(dest_file):
        backup(destination, f.path)
      createDir(dest_file)
      create_links(source_file, dest_file)
      continue

    if symlinkExists(dest_file):
      var cur_symlink_path = dest_file
      while symlinkExists(cur_symlink_path):
        cur_symlink_path = expandSymlink(cur_symlink_path)
      cur_symlink_path = expandFilename(cur_symlink_path)
      let new_symlink_path = expandFilename(source_file)
      if cur_symlink_path == new_symlink_path:
        echo "already good: ", f.path
        continue

    if existsFile(dest_file) or existsDir(dest_file) or
         symlinkExists(dest_file):
      backup(destination, f.path)

    if symlinkExists(source_file):
      source_file = expandSymlink(source_file)
    echo "- creating symlink from ", source_file, " to ", dest_file
    createSymlink(source_file, dest_file)

if not existsDir(dotfiles / ".config"):
  echo "The dotfiles folder doesn't contain a .config folder"
else:
  create_links(dotfiles / ".config", dest_config)
create_links(dotfiles, dest_main)
