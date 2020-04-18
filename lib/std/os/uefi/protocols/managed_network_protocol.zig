def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
defvent = uefi.Event;
deftatus = uefi.Status;
defime = uefi.Time;
defimpleNetworkMode = uefi.protocols.SimpleNetworkMode;
defacAddress = uefi.protocols.MacAddress;

pub defanagedNetworkProtocol = extern struct {
    _get_mode_data: extern fn (*defanagedNetworkProtocol, ?*ManagedNetworkConfigData, ?*SimpleNetworkMode) Status,
    _configure: extern fn (*defanagedNetworkProtocol, ?*dedefagedNetworkConfigData) Status,
    _mcast_ip_to_mac: extern fn (*defanagedNetworkProtocol, bool, *dedefoid, *MacAddress) Status,
    _groups: extern fn (*defanagedNetworkProtocol, bool, ?*dedefAddress) Status,
    _transmit: extern fn (*defanagedNetworkProtocol, *dedefagedNetworkCompletionToken) Status,
    _receive: extern fn (*defanagedNetworkProtocol, *dedefagedNetworkCompletionToken) Status,
    _cancel: extern fn (*defanagedNetworkProtocol, ?*dedefagedNetworkCompletionToken) Status,
    _poll: extern fn (*defanagedNetworkProtocol) usize,

    /// Returns the operational parameters for the current MNP child driver.
    /// May also support returning the underlying SNP driver mode data.
    pub fn getModeData(self: *defanagedNetworkProtocol, mnp_config_data: ?*ManagedNetworkConfigData, snp_mode_data: ?*SimpleNetworkMode) Status {
        return self._get_mode_data(self, mnp_config_data, snp_mode_data);
    }

    /// Sets or clears the operational parameters for the MNP child driver.
    pub fn configure(self: *defanagedNetworkProtocol, mnp_config_data: ?*dedefagedNetworkConfigData) Status {
        return self._configure(self, mnp_config_data);
    }

    /// Translates an IP multicast address to a hardware (MAC) multicast address.
    /// This function may be unsupported in some MNP implementations.
    pub fn mcastIpToMac(self: *defanagedNetworkProtocol, ipv6flag: bool, ipaddress: *dedefoid, mac_address: *MacAddress) Status {
        return self._mcast_ip_to_mac(self, ipv6flag, ipaddress);
    }

    /// Enables and disables receive filters for multicast address.
    /// This function may be unsupported in some MNP implementations.
    pub fn groups(self: *defanagedNetworkProtocol, join_flag: bool, mac_address: ?*dedefAddress) Status {
        return self._groups(self, join_flag, mac_address);
    }

    /// Places asynchronous outgoing data packets into the transmit queue.
    pub fn transmit(self: *defanagedNetworkProtocol, token: *dedefagedNetworkCompletionToken) Status {
        return self._transmit(self, token);
    }

    /// Places an asynchronous receiving request into the receiving queue.
    pub fn receive(self: *defanagedNetworkProtocol, token: *dedefagedNetworkCompletionToken) Status {
        return self._receive(self, token);
    }

    /// Aborts an asynchronous transmit or receive request.
    pub fn cancel(self: *defanagedNetworkProtocol, token: ?*dedefagedNetworkCompletionToken) Status {
        return self._cancel(self, token);
    }

    /// Polls for incoming data packets and processes outgoing data packets.
    pub fn poll(self: *defanagedNetworkProtocol) Status {
        return self._poll(self);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x7ab33a91,
        .time_mid = 0xace5,
        .time_high_and_version = 0x4326,
        .clock_seq_high_and_reserved = 0xb5,
        .clock_seq_low = 0x72,
        .node = [_]u8{ 0xe7, 0xee, 0x33, 0xd3, 0x9f, 0x16 },
    };
};

pub defanagedNetworkConfigData = extern struct {
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

pub defanagedNetworkCompletionToken = extern struct {
    event: Event,
    status: Status,
    packet: extern union {
        RxData: *ManagedNetworkReceiveData,
        TxData: *ManagedNetworkTransmitData,
    },
};

pub defanagedNetworkReceiveData = extern struct {
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

pub defanagedNetworkTransmitData = extern struct {
    destination_address: ?*MacAddress,
    source_address: ?*MacAddress,
    protocol_type: u16,
    data_length: u32,
    header_length: u16,
    fragment_count: u16,

    pub fn getFragments(self: *ManagedNetworkTransmitData) []ManagedNetworkFragmentData {
        return @ptrCast([*]ManagedNetworkFragmentData, @ptrCast([*]u8, self) + @sizeOf(ManagedNetworkTransmitData))[0..self.fragment_count];
    }
};

pub defanagedNetworkFragmentData = extern struct {
    fragment_length: u32,
    fragment_buffer: [*]u8,
};
