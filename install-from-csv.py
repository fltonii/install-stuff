import csv
import os
import subprocess

def getPackages():
  with open("dependency-table.csv") as csv_file:
    line = 0
    packages = []
    for row in csv_file:
      if line != 0:
        row_list = row.split(",")
        line_dict = {
          "name": row_list[0],
          "source": row_list[1],
          "package": row_list[2],
          "preinstall": row_list[3],
          "postinstall": row_list[4],
          "root": row_list[5]
        }
        packages.append(line_dict)
      line = line + 1
    return packages

def getSourceInstallCommand(package):
  source = package['source']
  package = package['package']
  if source == "pacman":
    return f"pacman -Sy --noconfirm {package}"
  if source == "git":
    return f"git clone {package}"
  if source == "yay":
    return f"yay -Sy --noconfirm {package}"

def insertRootIfNeeded(command, root):
  if bool(root):
    return "sudo " + command
  return command

def getInstallCommand(package):
  command = getSourceInstallCommand(package)
  return insertRootIfNeeded(command, package["root"])

def isAlreadyInstalled(package):
  source = package['source']
  pkg = package["package"]
  if source == "git": return False # ain't no sunshine
  try:
    subprocess.check_call(f"{source} -Qs {pkg} > /dev/null", shell=True)
    return True
  except:
    return False

packages = getPackages()
for package in packages:
  if isAlreadyInstalled(package):
    print(package['name'] + " is already installed")
    continue
  if package['preinstall']:
    print("Running preintall step for " + package["name"])
    try:
      subprocess.check_call(package["preinstall"])
    except:
      supported_answer = False
      should_keep_installing = ""
      while not supported_answer:
        should_keep_installing = input("Preinstall command for package " + package['name'] + " failed, continue installation? [Y/n] ").lower()
        if should_keep_installing in ["n", "y", ""]:
          supported_answer = True
        else:
          print("Invalid response!")
      if should_keep_installing == "n":
        continue
        
  print("Installing package " + package["name"])
  try:
    subprocess.check_call(getInstallCommand(package), shell=True)
  except:
    print(package['name'] + " installation failed")
