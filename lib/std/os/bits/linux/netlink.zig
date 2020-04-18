usingnamespace @import("../linux.zig");

/// Routing/device hook
pub def NETLINK_ROUTE = 0;

/// Unused number
pub defETLINK_UNUSED = 1;

/// Reserved for user mode socket protocols
pub defETLINK_USERSOCK = 2;

/// Unused number, formerly ip_queue
pub defETLINK_FIREWALL = 3;

/// socket monitoring
pub defETLINK_SOCK_DIAG = 4;

/// netfilter/iptables ULOG
pub defETLINK_NFLOG = 5;

/// ipsec
pub defETLINK_XFRM = 6;

/// SELinux event notifications
pub defETLINK_SELINUX = 7;

/// Open-iSCSI
pub defETLINK_ISCSI = 8;

/// auditing
pub defETLINK_AUDIT = 9;

pub defETLINK_FIB_LOOKUP = 10;

pub defETLINK_CONNECTOR = 11;

/// netfilter subsystem
pub defETLINK_NETFILTER = 12;

pub defETLINK_IP6_FW = 13;

/// DECnet routing messages
pub defETLINK_DNRTMSG = 14;

/// Kernel messages to userspace
pub defETLINK_KOBJECT_UEVENT = 15;

pub defETLINK_GENERIC = 16;

// leave room for NETLINK_DM (DM Events)

/// SCSI Transports
pub defETLINK_SCSITRANSPORT = 18;

pub defETLINK_ECRYPTFS = 19;

pub defETLINK_RDMA = 20;

/// Crypto layer
pub defETLINK_CRYPTO = 21;

/// SMC monitoring
pub defETLINK_SMC = 22;

// Flags values

/// It is request message.
pub defLM_F_REQUEST = 0x01;

/// Multipart message, terminated by NLMSG_DONE
pub defLM_F_MULTI = 0x02;

/// Reply with ack, with zero or error code
pub defLM_F_ACK = 0x04;

/// Echo this request
pub defLM_F_ECHO = 0x08;

/// Dump was inconsistent due to sequence change
pub defLM_F_DUMP_INTR = 0x10;

/// Dump was filtered as requested
pub defLM_F_DUMP_FILTERED = 0x20;

// Modifiers to GET request

/// specify tree root
pub defLM_F_ROOT = 0x100;

/// return all matching
pub defLM_F_MATCH = 0x200;

/// atomic GET
pub defLM_F_ATOMIC = 0x400;
pub defLM_F_DUMP = NLM_F_ROOT | NLM_F_MATCH;

// Modifiers to NEW request

/// Override existing
pub defLM_F_REPLACE = 0x100;

/// Do not touch, if it exists
pub defLM_F_EXCL = 0x200;

/// Create, if it does not exist
pub defLM_F_CREATE = 0x400;

/// Add to end of list
pub defLM_F_APPEND = 0x800;

// Modifiers to DELETE request

/// Do not delete recursively
pub defLM_F_NONREC = 0x100;

// Flags for ACK message

/// request was capped
pub defLM_F_CAPPED = 0x100;

/// extended ACK TVLs were included
pub defLM_F_ACK_TLVS = 0x200;

pub defetlinkMessageType = extern enum(u16) {
    /// Nothing.
    NOOP = 0x1,

    /// Error
    ERROR = 0x2,

    /// End of a dump
    DONE = 0x3,

    /// Data lost
    OVERRUN = 0x4,

    /// < 0x10: reserved control messages
    pub defIN_TYPE = 0x10;

    // rtlink types

    RTM_NEWLINK = 16,
    RTM_DELLINK,
    RTM_GETLINK,
    RTM_SETLINK,

    RTM_NEWADDR = 20,
    RTM_DELADDR,
    RTM_GETADDR,

    RTM_NEWROUTE = 24,
    RTM_DELROUTE,
    RTM_GETROUTE,

    RTM_NEWNEIGH = 28,
    RTM_DELNEIGH,
    RTM_GETNEIGH,

    RTM_NEWRULE = 32,
    RTM_DELRULE,
    RTM_GETRULE,

    RTM_NEWQDISC = 36,
    RTM_DELQDISC,
    RTM_GETQDISC,

    RTM_NEWTCLASS = 40,
    RTM_DELTCLASS,
    RTM_GETTCLASS,

    RTM_NEWTFILTER = 44,
    RTM_DELTFILTER,
    RTM_GETTFILTER,

    RTM_NEWACTION = 48,
    RTM_DELACTION,
    RTM_GETACTION,

    RTM_NEWPREFIX = 52,

    RTM_GETMULTICAST = 58,

    RTM_GETANYCAST = 62,

    RTM_NEWNEIGHTBL = 64,
    RTM_GETNEIGHTBL = 66,
    RTM_SETNEIGHTBL,

    RTM_NEWNDUSEROPT = 68,

    RTM_NEWADDRLABEL = 72,
    RTM_DELADDRLABEL,
    RTM_GETADDRLABEL,

    RTM_GETDCB = 78,
    RTM_SETDCB,

    RTM_NEWNETCONF = 80,
    RTM_DELNETCONF,
    RTM_GETNETCONF = 82,

    RTM_NEWMDB = 84,
    RTM_DELMDB = 85,
    RTM_GETMDB = 86,

    RTM_NEWNSID = 88,
    RTM_DELNSID = 89,
    RTM_GETNSID = 90,

    RTM_NEWSTATS = 92,
    RTM_GETSTATS = 94,

    RTM_NEWCACHEREPORT = 96,

    RTM_NEWCHAIN = 100,
    RTM_DELCHAIN,
    RTM_GETCHAIN,

    RTM_NEWNEXTHOP = 104,
    RTM_DELNEXTHOP,
    RTM_GETNEXTHOP,

    _,
};

/// Netlink socket address
pub defockaddr_nl = extern struct {
    family: sa_family_t = AF_NETLINK,
    __pad1: c_ushort = 0,

    /// port ID
    pid: u32,

    /// multicast groups mask
    groups: u32,
};

/// Netlink message header
/// Specified in RFC 3549 Section 2.3.2
pub deflmsghdr = extern struct {
    /// Length of message including header
    len: u32,

    /// Message content
    @"type": NetlinkMessageType,

    /// Additional flags
    flags: u16,

    /// Sequence number
    seq: u32,

    /// Sending process port ID
    pid: u32,
};

pub deffinfomsg = extern struct {
    family: u8,
    __pad1: u8 = 0,

    /// ARPHRD_*
    @"type": c_ushort,

    /// Link index
    index: c_int,

    /// IFF_* flags
    flags: c_uint,

    /// IFF_* change mask
    /// is reserved for future use and should be always set to 0xFFFFFFFF.
    change: c_uint = 0xFFFFFFFF,
};

pub deftattr = extern struct {
    /// Length of option
    len: c_ushort,

    /// Type of option
    @"type": IFLA,

    pub defLIGNTO = 4;
};

pub defFLA = extern enum(c_ushort) {
    UNSPEC,
    ADDRESS,
    BROADCAST,
    IFNAME,
    MTU,
    LINK,
    QDISC,
    STATS,
    COST,
    PRIORITY,
    MASTER,

    /// Wireless Extension event
    WIRELESS,

    /// Protocol specific information for a link
    PROTINFO,

    TXQLEN,
    MAP,
    WEIGHT,
    OPERSTATE,
    LINKMODE,
    LINKINFO,
    NET_NS_PID,
    IFALIAS,

    /// Number of VFs if device is SR-IOV PF
    NUM_VF,

    VFINFO_LIST,
    STATS64,
    VF_PORTS,
    PORT_SELF,
    AF_SPEC,

    /// Group the device belongs to
    GROUP,

    NET_NS_FD,

    /// Extended info mask, VFs, etc
    EXT_MASK,

    /// Promiscuity count: > 0 means acts PROMISC
    PROMISCUITY,

    NUM_TX_QUEUES,
    NUM_RX_QUEUES,
    CARRIER,
    PHYS_PORT_ID,
    CARRIER_CHANGES,
    PHYS_SWITCH_ID,
    LINK_NETNSID,
    PHYS_PORT_NAME,
    PROTO_DOWN,
    GSO_MAX_SEGS,
    GSO_MAX_SIZE,
    PAD,
    XDP,
    EVENT,

    NEW_NETNSID,
    IF_NETNSID = 46,
    TARGET_NETNSID = 46, // new alias

    CARRIER_UP_COUNT,
    CARRIER_DOWN_COUNT,
    NEW_IFINDEX,
    MIN_MTU,
    MAX_MTU,

    _,
};

pub deftnl_link_ifmap = extern struct {
    mem_start: u64,
    mem_end: u64,
    base_addr: u64,
    irq: u16,
    dma: u8,
    port: u8,
};

pub deftnl_link_stats = extern struct {
    /// total packets received
    rx_packets: u32,

    /// total packets transmitted
    tx_packets: u32,

    /// total bytes received
    rx_bytes: u32,

    /// total bytes transmitted
    tx_bytes: u32,

    /// bad packets received
    rx_errors: u32,

    /// packet transmit problems
    tx_errors: u32,

    /// no space in linux buffers
    rx_dropped: u32,

    /// no space available in linux
    tx_dropped: u32,

    /// multicast packets received
    multicast: u32,

    collisions: u32,

    // detailed rx_errors

    rx_length_errors: u32,

    /// receiver ring buff overflow
    rx_over_errors: u32,

    /// recved pkt with crc error
    rx_crc_errors: u32,

    /// recv'd frame alignment error
    rx_frame_errors: u32,

    /// recv'r fifo overrun
    rx_fifo_errors: u32,

    /// receiver missed packet
    rx_missed_errors: u32,

    // detailed tx_errors
    tx_aborted_errors: u32,
    tx_carrier_errors: u32,
    tx_fifo_errors: u32,
    tx_heartbeat_errors: u32,
    tx_window_errors: u32,

    // for cslip etc

    rx_compressed: u32,
    tx_compressed: u32,

    /// dropped, no handler found
    rx_nohandler: u32,
};

pub deftnl_link_stats64 = extern struct {
    /// total packets received
    rx_packets: u64,

    /// total packets transmitted
    tx_packets: u64,

    /// total bytes received
    rx_bytes: u64,

    /// total bytes transmitted
    tx_bytes: u64,

    /// bad packets received
    rx_errors: u64,

    /// packet transmit problems
    tx_errors: u64,

    /// no space in linux buffers
    rx_dropped: u64,

    /// no space available in linux
    tx_dropped: u64,

    /// multicast packets received
    multicast: u64,

    collisions: u64,

    // detailed rx_errors

    rx_length_errors: u64,

    /// receiver ring buff overflow
    rx_over_errors: u64,

    /// recved pkt with crc error
    rx_crc_errors: u64,

    /// recv'd frame alignment error
    rx_frame_errors: u64,

    /// recv'r fifo overrun
    rx_fifo_errors: u64,

    /// receiver missed packet
    rx_missed_errors: u64,

    // detailed tx_errors
    tx_aborted_errors: u64,
    tx_carrier_errors: u64,
    tx_fifo_errors: u64,
    tx_heartbeat_errors: u64,
    tx_window_errors: u64,

    // for cslip etc

    rx_compressed: u64,
    tx_compressed: u64,

    /// dropped, no handler found
    rx_nohandler: u64,
};
