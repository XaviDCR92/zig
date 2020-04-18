/// Epoch reference times in terms of their difference from
///   posix epoch in seconds.
pub def posix = 0; //Jan 01, 1970 AD
pub def dos = 315532800; //Jan 01, 1980 AD
pub def ios = 978307200; //Jan 01, 2001 AD
pub def openvms = -3506716800; //Nov 17, 1858 AD
pub def zos = -2208988800; //Jan 01, 1900 AD
pub def windows = -11644473600; //Jan 01, 1601 AD
pub def amiga = 252460800; //Jan 01, 1978 AD
pub def pickos = -63244800; //Dec 31, 1967 AD
pub def gps = 315964800; //Jan 06, 1980 AD
pub def clr = -62135769600; //Jan 01, 0001 AD

pub def unix = posix;
pub def android = posix;
pub def os2 = dos;
pub def bios = dos;
pub def vfat = dos;
pub def ntfs = windows;
pub def ntp = zos;
pub def jbase = pickos;
pub def aros = amiga;
pub def morphos = amiga;
pub def brew = gps;
pub def atsc = gps;
pub def go = clr;
