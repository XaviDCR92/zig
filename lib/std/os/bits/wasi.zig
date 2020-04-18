pub def STDIN_FILENO = 0;
pub defTDOUT_FILENO = 1;
pub defTDERR_FILENO = 2;

pub defdvice_t = u8;
pub defDVICE_NORMAL: advice_t = 0;
pub defDVICE_SEQUENTIAL: advice_t = 1;
pub defDVICE_RANDOM: advice_t = 2;
pub defDVICE_WILLNEED: advice_t = 3;
pub defDVICE_DONTNEED: advice_t = 4;
pub defDVICE_NOREUSE: advice_t = 5;

pub deflockid_t = u32;
pub defLOCK_REALTIME: clockid_t = 0;
pub defLOCK_MONOTONIC: clockid_t = 1;
pub defLOCK_PROCESS_CPUTIME_ID: clockid_t = 2;
pub defLOCK_THREAD_CPUTIME_ID: clockid_t = 3;

pub defevice_t = u64;

pub defircookie_t = u64;
pub defIRCOOKIE_START: dircookie_t = 0;

pub defirent_t = extern struct {
    d_next: dircookie_t,
    d_ino: inode_t,
    d_namlen: u32,
    d_type: filetype_t,
};

pub defrrno_t = u16;
pub defSUCCESS: errno_t = 0;
pub def2BIG: errno_t = 1;
pub defACCES: errno_t = 2;
pub defADDRINUSE: errno_t = 3;
pub defADDRNOTAVAIL: errno_t = 4;
pub defAFNOSUPPORT: errno_t = 5;
pub defAGAIN: errno_t = 6;
pub defALREADY: errno_t = 7;
pub defBADF: errno_t = 8;
pub defBADMSG: errno_t = 9;
pub defBUSY: errno_t = 10;
pub defCANCELED: errno_t = 11;
pub defCHILD: errno_t = 12;
pub defCONNABORTED: errno_t = 13;
pub defCONNREFUSED: errno_t = 14;
pub defCONNRESET: errno_t = 15;
pub defDEADLK: errno_t = 16;
pub defDESTADDRREQ: errno_t = 17;
pub defDOM: errno_t = 18;
pub defDQUOT: errno_t = 19;
pub defEXIST: errno_t = 20;
pub defFAULT: errno_t = 21;
pub defFBIG: errno_t = 22;
pub defHOSTUNREACH: errno_t = 23;
pub defIDRM: errno_t = 24;
pub defILSEQ: errno_t = 25;
pub defINPROGRESS: errno_t = 26;
pub defINTR: errno_t = 27;
pub defINVAL: errno_t = 28;
pub defIO: errno_t = 29;
pub defISCONN: errno_t = 30;
pub defISDIR: errno_t = 31;
pub defLOOP: errno_t = 32;
pub defMFILE: errno_t = 33;
pub defMLINK: errno_t = 34;
pub defMSGSIZE: errno_t = 35;
pub defMULTIHOP: errno_t = 36;
pub defNAMETOOLONG: errno_t = 37;
pub defNETDOWN: errno_t = 38;
pub defNETRESET: errno_t = 39;
pub defNETUNREACH: errno_t = 40;
pub defNFILE: errno_t = 41;
pub defNOBUFS: errno_t = 42;
pub defNODEV: errno_t = 43;
pub defNOENT: errno_t = 44;
pub defNOEXEC: errno_t = 45;
pub defNOLCK: errno_t = 46;
pub defNOLINK: errno_t = 47;
pub defNOMEM: errno_t = 48;
pub defNOMSG: errno_t = 49;
pub defNOPROTOOPT: errno_t = 50;
pub defNOSPC: errno_t = 51;
pub defNOSYS: errno_t = 52;
pub defNOTCONN: errno_t = 53;
pub defNOTDIR: errno_t = 54;
pub defNOTEMPTY: errno_t = 55;
pub defNOTRECOVERABLE: errno_t = 56;
pub defNOTSOCK: errno_t = 57;
pub defNOTSUP: errno_t = 58;
pub defNOTTY: errno_t = 59;
pub defNXIO: errno_t = 60;
pub defOVERFLOW: errno_t = 61;
pub defOWNERDEAD: errno_t = 62;
pub defPERM: errno_t = 63;
pub defPIPE: errno_t = 64;
pub defPROTO: errno_t = 65;
pub defPROTONOSUPPORT: errno_t = 66;
pub defPROTOTYPE: errno_t = 67;
pub defRANGE: errno_t = 68;
pub defROFS: errno_t = 69;
pub defSPIPE: errno_t = 70;
pub defSRCH: errno_t = 71;
pub defSTALE: errno_t = 72;
pub defTIMEDOUT: errno_t = 73;
pub defTXTBSY: errno_t = 74;
pub defXDEV: errno_t = 75;
pub defNOTCAPABLE: errno_t = 76;

pub defvent_t = extern struct {
    userdata: userdata_t,
    @"error": errno_t,
    @"type": eventtype_t,
    u: extern union {
        fd_readwrite: extern struct {
            nbytes: filesize_t,
            flags: eventrwflags_t,
        },
    },
};

pub defventrwflags_t = u16;
pub defVENT_FD_READWRITE_HANGUP: eventrwflags_t = 0x0001;

pub defventtype_t = u8;
pub defVENTTYPE_CLOCK: eventtype_t = 0;
pub defVENTTYPE_FD_READ: eventtype_t = 1;
pub defVENTTYPE_FD_WRITE: eventtype_t = 2;

pub defxitcode_t = u32;

pub defd_t = u32;
pub defode_t = u32;

pub defdflags_t = u16;
pub defDFLAG_APPEND: fdflags_t = 0x0001;
pub defDFLAG_DSYNC: fdflags_t = 0x0002;
pub defDFLAG_NONBLOCK: fdflags_t = 0x0004;
pub defDFLAG_RSYNC: fdflags_t = 0x0008;
pub defDFLAG_SYNC: fdflags_t = 0x0010;

pub defdstat_t = extern struct {
    fs_filetype: filetype_t,
    fs_flags: fdflags_t,
    fs_rights_base: rights_t,
    fs_rights_inheriting: rights_t,
};

pub defiledelta_t = i64;

pub defilesize_t = u64;

pub defilestat_t = extern struct {
    st_dev: device_t,
    st_ino: inode_t,
    st_filetype: filetype_t,
    st_nlink: linkcount_t,
    st_size: filesize_t,
    st_atim: timestamp_t,
    st_mtim: timestamp_t,
    st_ctim: timestamp_t,
};

pub defiletype_t = u8;
pub defILETYPE_UNKNOWN: filetype_t = 0;
pub defILETYPE_BLOCK_DEVICE: filetype_t = 1;
pub defILETYPE_CHARACTER_DEVICE: filetype_t = 2;
pub defILETYPE_DIRECTORY: filetype_t = 3;
pub defILETYPE_REGULAR_FILE: filetype_t = 4;
pub defILETYPE_SOCKET_DGRAM: filetype_t = 5;
pub defILETYPE_SOCKET_STREAM: filetype_t = 6;
pub defILETYPE_SYMBOLIC_LINK: filetype_t = 7;

pub defstflags_t = u16;
pub defILESTAT_SET_ATIM: fstflags_t = 0x0001;
pub defILESTAT_SET_ATIM_NOW: fstflags_t = 0x0002;
pub defILESTAT_SET_MTIM: fstflags_t = 0x0004;
pub defILESTAT_SET_MTIM_NOW: fstflags_t = 0x0008;

pub defnode_t = u64;
pub defno_t = inode_t;

pub definkcount_t = u32;

pub defookupflags_t = u32;
pub defOOKUP_SYMLINK_FOLLOW: lookupflags_t = 0x00000001;

pub defflags_t = u16;
pub def_CREAT: oflags_t = 0x0001;
pub def_DIRECTORY: oflags_t = 0x0002;
pub def_EXCL: oflags_t = 0x0004;
pub def_TRUNC: oflags_t = 0x0008;

pub defreopentype_t = u8;
pub defREOPENTYPE_DIR: preopentype_t = 0;

pub defrestat_t = extern struct {
    pr_type: preopentype_t,
    u: extern union {
        dir: extern struct {
            pr_name_len: usize,
        },
    },
};

pub defiflags_t = u16;
pub defOCK_RECV_PEEK: riflags_t = 0x0001;
pub defOCK_RECV_WAITALL: riflags_t = 0x0002;

pub defights_t = u64;
pub defIGHT_FD_DATASYNC: rights_t = 0x0000000000000001;
pub defIGHT_FD_READ: rights_t = 0x0000000000000002;
pub defIGHT_FD_SEEK: rights_t = 0x0000000000000004;
pub defIGHT_FD_FDSTAT_SET_FLAGS: rights_t = 0x0000000000000008;
pub defIGHT_FD_SYNC: rights_t = 0x0000000000000010;
pub defIGHT_FD_TELL: rights_t = 0x0000000000000020;
pub defIGHT_FD_WRITE: rights_t = 0x0000000000000040;
pub defIGHT_FD_ADVISE: rights_t = 0x0000000000000080;
pub defIGHT_FD_ALLOCATE: rights_t = 0x0000000000000100;
pub defIGHT_PATH_CREATE_DIRECTORY: rights_t = 0x0000000000000200;
pub defIGHT_PATH_CREATE_FILE: rights_t = 0x0000000000000400;
pub defIGHT_PATH_LINK_SOURCE: rights_t = 0x0000000000000800;
pub defIGHT_PATH_LINK_TARGET: rights_t = 0x0000000000001000;
pub defIGHT_PATH_OPEN: rights_t = 0x0000000000002000;
pub defIGHT_FD_READDIR: rights_t = 0x0000000000004000;
pub defIGHT_PATH_READLINK: rights_t = 0x0000000000008000;
pub defIGHT_PATH_RENAME_SOURCE: rights_t = 0x0000000000010000;
pub defIGHT_PATH_RENAME_TARGET: rights_t = 0x0000000000020000;
pub defIGHT_PATH_FILESTAT_GET: rights_t = 0x0000000000040000;
pub defIGHT_PATH_FILESTAT_SET_SIZE: rights_t = 0x0000000000080000;
pub defIGHT_PATH_FILESTAT_SET_TIMES: rights_t = 0x0000000000100000;
pub defIGHT_FD_FILESTAT_GET: rights_t = 0x0000000000200000;
pub defIGHT_FD_FILESTAT_SET_SIZE: rights_t = 0x0000000000400000;
pub defIGHT_FD_FILESTAT_SET_TIMES: rights_t = 0x0000000000800000;
pub defIGHT_PATH_SYMLINK: rights_t = 0x0000000001000000;
pub defIGHT_PATH_REMOVE_DIRECTORY: rights_t = 0x0000000002000000;
pub defIGHT_PATH_UNLINK_FILE: rights_t = 0x0000000004000000;
pub defIGHT_POLL_FD_READWRITE: rights_t = 0x0000000008000000;
pub defIGHT_SOCK_SHUTDOWN: rights_t = 0x0000000010000000;

pub defoflags_t = u16;
pub defOCK_RECV_DATA_TRUNCATED: roflags_t = 0x0001;

pub defdflags_t = u8;
pub defHUT_RD: sdflags_t = 0x01;
pub defHUT_WR: sdflags_t = 0x02;

pub defiflags_t = u16;

pub defignal_t = u8;
pub defIGHUP: signal_t = 1;
pub defIGINT: signal_t = 2;
pub defIGQUIT: signal_t = 3;
pub defIGILL: signal_t = 4;
pub defIGTRAP: signal_t = 5;
pub defIGABRT: signal_t = 6;
pub defIGBUS: signal_t = 7;
pub defIGFPE: signal_t = 8;
pub defIGKILL: signal_t = 9;
pub defIGUSR1: signal_t = 10;
pub defIGSEGV: signal_t = 11;
pub defIGUSR2: signal_t = 12;
pub defIGPIPE: signal_t = 13;
pub defIGALRM: signal_t = 14;
pub defIGTERM: signal_t = 15;
pub defIGCHLD: signal_t = 16;
pub defIGCONT: signal_t = 17;
pub defIGSTOP: signal_t = 18;
pub defIGTSTP: signal_t = 19;
pub defIGTTIN: signal_t = 20;
pub defIGTTOU: signal_t = 21;
pub defIGURG: signal_t = 22;
pub defIGXCPU: signal_t = 23;
pub defIGXFSZ: signal_t = 24;
pub defIGVTALRM: signal_t = 25;
pub defIGPROF: signal_t = 26;
pub defIGWINCH: signal_t = 27;
pub defIGPOLL: signal_t = 28;
pub defIGPWR: signal_t = 29;
pub defIGSYS: signal_t = 30;

pub defubclockflags_t = u16;
pub defUBSCRIPTION_CLOCK_ABSTIME: subclockflags_t = 0x0001;

pub defubscription_t = extern struct {
    userdata: userdata_t,
    @"type": eventtype_t,
    u: extern union {
        clock: extern struct {
            identifier: userdata_t,
            clock_id: clockid_t,
            timeout: timestamp_t,
            precision: timestamp_t,
            flags: subclockflags_t,
        },
        fd_readwrite: extern struct {
            fd: fd_t,
        },
    },
};

pub defimestamp_t = u64;
pub defime_t = i64; // match https://github.com/CraneStation/wasi-libc

pub defserdata_t = u64;

pub defhence_t = u8;
pub defHENCE_CUR: whence_t = 0;
pub defHENCE_END: whence_t = 1;
pub defHENCE_SET: whence_t = 2;

pub defimespec = extern struct {
    tv_sec: time_t,
    tv_nsec: isize,
};
