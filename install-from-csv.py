import csv
import os
import subprocess

PACKAGE = None

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
                }
                packages.append(line_dict)
            line = line + 1
        return packages

def getInstallCommand():
    source = PACKAGE['source']
    package_name = package['package']
    if source == "pacman":
        return f"pacman -Sy --noconfirm {package_name}"
    elif source == "yay":
        return f"yay -Sy --noconfirm {package_name}"
    if source == "pip":
        return f"sudo pip install {package_name}"

def isAlreadyInstalled():
    source = PACKAGE['source']
    pkg = PACKAGE["package"]
    if source == "pip":
        return False
    try:
        subprocess.check_call(f"{source} -Qs {pkg} > /dev/null", shell=True)
        return True
    except:
        return False

def runInstallationStep():
    print("Installing package " + PACKAGE["name"])
    print(getInstallCommand())
    try:
        subprocess.check_call(getInstallCommand(), shell=True)
    except:
        print("=== " + PACKAGE['name'] + " installation failed ===")
        raise Exception("install step failed")

packages = getPackages()
for package in packages:
    PACKAGE = package
    if isAlreadyInstalled():
        print(PACKAGE['name'] + " is already installed")
        continue
    try:
        runInstallationStep()
    except:
        continue
