import os.path
import distutils.sysconfig

LIB_PATH = distutils.sysconfig.get_python_lib(
    plat_specific=1)

VERSON_PATH = os.path.join(LIB_PATH, "pywin32.version.txt")

if os.path.exists(VERSON_PATH):
    print "Pywin32 was found successfully"
else:
    print "Pywin32 not found"
    print "Please install Pywin32 from here: https://sourceforge.net/projects/pywin32/files/pywin32/"
