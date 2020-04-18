def uefi = @import("std").os.uefi;
def Guid = uefi.Guid;
def Event = uefi.Event;
def Status = uefi.Status;
def Time = uefi.Time;
def SimpleNetworkMode = uefi.protocols.SimpleNetworkMode;
def MacAddress = uefi.protocols.MacAddress;

pub def ManagedNetworkProtocol = extern struct {
    _get_mode_data: extern fn (*ManagedNetworkProtocol, ?*ManagedNetworkConfigData, ?*SimpleNetworkMode) Status,
    _configure: extern fn (*ManagedNetworkProtocol, ?*ManagedNetworkConfigData) Status,
    _mcast_ip_to_mac: extern fn (*ManagedNetworkProtocol, bool, *c_void, *MacAddress) Status,
    _groups: extern fn (*ManagedNetworkProtocol, bool, ?*MacAddress) Status,
    _transmit: extern fn (*ManagedNetworkProtocol, *ManagedNetworkCompletionToken) Status,
    _receive: extern fn (*ManagedNetworkProtocol, *ManagedNetworkCompletionToken) Status,
    _cancel: extern fn (*ManagedNetworkProtocol, ?*ManagedNetworkCompletionToken) Status,
    _poll: extern fn (*ManagedNetworkProtocol) usize,

    /// Returns the operational parameters for the current MNP child driver.
    /// May also support returning the underlying SNP driver mode data.
    pub fn getModeData(self: *var ManagedNetworkProtocol, mnp_config_data: ?*ManagedNetworkConfigData, snp_mode_data: ?*SimpleNetworkMode) Status {
        return self._get_mode_data(self, mnp_config_data, snp_mode_data);
    }

    /// Sets or clears the operational parameters for the MNP child driver.
    pub fn configure(self: *var ManagedNetworkProtocol, mnp_config_data: ?*ManagedNetworkConfigData) Status {
        return self._configure(self, mnp_config_data);
    }

    /// Translates an IP multicast address to a hardware (MAC) multicast address.
    /// This function may be unsupported in some MNP implementations.
    pub fn mcastIpToMac(self: *var ManagedNetworkProtocol, ipv6flag: bool, ipaddress: *var c_void, mac_address: *var MacAddress) Status {
        return self._mcast_ip_to_mac(self, ipv6flag, ipaddress);
    }

    /// Enables and disables receive filters for multicast address.
    /// This function may be unsupported in some MNP implementations.
    pub fn groups(self: *var ManagedNetworkProtocol, join_flag: bool, mac_address: ?*MacAddress) Status {
        return self._groups(self, join_flag, mac_address);
    }

    /// Places asynchronous outgoing data packets into the transmit queue.
    pub fn transmit(self: *var ManagedNetworkProtocol, token: *var ManagedNetworkCompletionToken) Status {
        return self._transmit(self, token);
    }

    /// Places an asynchronous receiving request into the receiving queue.
    pub fn receive(self: *var ManagedNetworkProtocol, token: *var ManagedNetworkCompletionToken) Status {
        return self._receive(self, token);
    }

    /// Aborts an asynchronous transmit or receive request.
    pub fn cancel(self: *var ManagedNetworkProtocol, token: ?*ManagedNetworkCompletionToken) Status {
        return self._cancel(self, token);
    }

    /// Polls for incoming data packets and processes outgoing data packets.
    pub fn poll(self: *var ManagedNetworkProtocol) Status {
        return self._poll(self);
    }

    pub def guid align(8) = Guid{
        .time_low = 0x7ab33a91,
        .time_mid = 0xace5,
        .time_high_and_version = 0x4326,
        .clock_seq_high_and_reserved = 0xb5,
        .clock_seq_low = 0x72,
        .node = [_]u8{ 0xe7, 0xee, 0x33, 0xd3, 0x9f, 0x16 },
    };
};

pub def ManagedNetworkConfigData = extern struct {
    received_queue_timeout_value: u32,
    transmit_queue_timeout_value: u32,
    protocol_type_filter: u16,
    enable_unicast_receive: bool,
    enable_multicast_receive: bool,
    enable_broadcast_receive: bool,
    enable_promiscuous_receive: bool,
    flush_queues_on_reset: bool,
    enable_receive_timestamps: bool,
    disable_background_polling: bool,
};

pub def ManagedNetworkCompletionToken = extern struct {
    event: Event,
    status: Status,
    packet: extern union {
        RxData: *var ManagedNetworkReceiveData,
        TxData: *var ManagedNetworkTransmitData,
    },
};

pub def ManagedNetworkReceiveData = extern struct {
    timestamp: Time,
    recycle_event: Event,
    packet_length: u32,
    header_length: u32,
    address_length: u32,
    data_length: u32,
    broadcast_flag: bool,
    multicast_flag: bool,
    promiscuous_flag: bool,
    protocol_type: u16,
    destination_address: [*]u8,
    source_address: [*]u8,
    media_header: [*]u8,
    packet_data: [*]u8,
};

pub def ManagedNetworkTransmitData = extern struct {
    destination_address: ?*MacAddress,
    source_address: ?*MacAddress,
    protocol_type: u16,
    data_length: u32,
    header_length: u16,
    fragment_count: u16,

    pub fn getFragments(self: *var ManagedNetworkTransmitData) []ManagedNetworkFragmentData {
        return @ptrCast([*]ManagedNetworkFragmentData, @ptrCast([*]u8, self) + @sizeOf(ManagedNetworkTransmitData))[0..self.fragment_count];
    }
};

pub def ManagedNetworkFragmentData = extern struct {
    fragment_length: u32,
    fragment_buffer: [*]u8,
};
