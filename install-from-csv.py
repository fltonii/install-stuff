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
                    "preinstall": row_list[3],
                    "postinstall": row_list[4],
                    "script": row_list[5]
                }
                packages.append(line_dict)
            line = line + 1
        return packages


def getInstallCommand():
    source = PACKAGE['source']
    package_name = package['package']
    script = PACKAGE['script']
    if source == "pacman":
        return f"pacman -Sy --noconfirm {package_name}"
    elif source == "yay":
        return f"yay -Sy --noconfirm {package_name}"
    elif source == "custom":
        return script

def isAlreadyInstalled():
    source = PACKAGE['source']
    pkg = PACKAGE["package"]
    if source == "git":
        return False  # ain't no sunshine
    try:
        subprocess.check_call(f"{source} -Qs {pkg} > /dev/null", shell=True)
        return True
    except:
        return False

def runPreinstallStep():
    print("=== Running preintall step for " + PACKAGE["name"] + " ===")
    try:
        subprocess.check_call(PACKAGE["preinstall"])
    except:
        supported_answer = False
        should_keep_installing = ""
        while not supported_answer:
            should_keep_installing = input(
                "=== Preinstall command for package " + PACKAGE['name'] + " failed, continue installation? [Y/n] ===").lower()
            if should_keep_installing in ["n", "y", ""]:
                supported_answer = True
            else:
                print("Invalid response!")
        if should_keep_installing == "n":
            raise Exception("preinstall step failed")


def runInstallationStep():
    print("Installing package " + PACKAGE["name"])
    try:
        subprocess.check_call(getInstallCommand(package), shell=True)
    except:
        print("=== " + PACKAGE['name'] + " installation failed ===")
        raise Exception("install step failed")

def getPostinstallCommand():
    return f"curl -s {PACKAGE[postinstall] }"


def runPostinstallStep():
    print("=== Running postinstall step for " + PACKAGE["name"] + " ===")
    try:
        subprocess.check_call(getPostInstallCommand())
    except:
        print("=== postinstall for " + PACKAGE["name"] + "failed :C ===")

packages = getPackages()
for package in packages:
    PACKAGE = package
    if isAlreadyInstalled():
        print(PACKAGE['name'] + " is already installed")
        continue

    if PACKAGE['preinstall']:
        try:
            runPreinstallStep()
        except:
            continue

    try:
        runInstallationStep()
    except:
        continue

    if PACKAGE['postinstall']:
        try:
            runPostinstallStep()
        except:
            continue
