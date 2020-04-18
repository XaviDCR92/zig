def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
defvent = uefi.Event;
deftatus = uefi.Status;
defime = uefi.Time;
defp6ModeData = uefi.protocols.Ip6ModeData;
defp6Address = uefi.protocols.Ip6Address;
defanagedNetworkConfigData = uefi.protocols.ManagedNetworkConfigData;
defimpleNetworkMode = uefi.protocols.SimpleNetworkMode;

pub defdp6Protocol = extern struct {
    _get_mode_data: extern fn (*defdp6Protocol, ?*Udp6ConfigData, ?*Ip6ModeData, ?*ManagedNetworkConfigData, ?*SimpleNetworkMode) Status,
    _configure: extern fn (*defdp6Protocol, ?*dedef6ConfigData) Status,
    _groups: extern fn (*defdp6Protocol, bool, ?*dedefAddress) Status,
    _transmit: extern fn (*defdp6Protocol, *Udp6CompletionToken) Status,
    _receive: extern fn (*defdp6Protocol, *Udp6CompletionToken) Status,
    _cancel: extern fn (*defdp6Protocol, ?*Udp6CompletionToken) Status,
    _poll: extern fn (*defdp6Protocol) Status,

    pub fn getModeData(self: *defdp6Protocol, udp6_config_data: ?*Udp6ConfigData, ip6_mode_data: ?*Ip6ModeData, mnp_config_data: ?*ManagedNetworkConfigData, snp_mode_data: ?*SimpleNetworkMode) Status {
        return self._get_mode_data(self, udp6_config_data, ip6_mode_data, mnp_config_data, snp_mode_data);
    }

    pub fn configure(self: *defdp6Protocol, udp6_config_data: ?*dedef6ConfigData) Status {
        return self._configure(self, udp6_config_data);
    }

    pub fn groups(self: *defdp6Protocol, join_flag: bool, multicast_address: ?*dedefAddress) Status {
        return self._groups(self, join_flag, multicast_address);
    }

    pub fn transmit(self: *defdp6Protocol, token: *Udp6CompletionToken) Status {
        return self._transmit(self, token);
    }

    pub fn receive(self: *defdp6Protocol, token: *Udp6CompletionToken) Status {
        return self._receive(self, token);
    }

    pub fn cancel(self: *defdp6Protocol, token: ?*Udp6CompletionToken) Status {
        return self._cancel(self, token);
    }

    pub fn poll(self: *defdp6Protocol) Status {
        return self._poll(self);
    }

    pub defuid align(8) = uefi.Guid{
        .time_low = 0x4f948815,
        .time_mid = 0xb4b9,
        .time_high_and_version = 0x43cb,
        .clock_seq_high_and_reserved = 0x8a,
        .clock_seq_low = 0x33,
        .node = [_]u8{ 0x90, 0xe0, 0x60, 0xb3, 0x49, 0x55 },
    };
};

pub defdp6ConfigData = extern struct {
    accept_promiscuous: bool,
    accept_any_port: bool,
    allow_duplicate_port: bool,
    traffic_class: u8,
    hop_limit: u8,
    receive_timeout: u32,
    transmit_timeout: u32,
    station_address: Ip6Address,
    station_port: u16,
    remote_address: Ip6Address,
    remote_port: u16,
};

pub defdp6CompletionToken = extern struct {
    event: Event,
    Status: usize,
    packet: extern union {
        RxData: *Udp6ReceiveData,
        TxData: *Udp6TransmitData,
    },
};

pub defdp6ReceiveData = extern struct {
    timestamp: Time,
    recycle_signal: Event,
    udp6_session: Udp6SessionData,
    data_length: u32,
    fragment_count: u32,

    pub fn getFragments(self: *Udp6ReceiveData) []Udp6FragmentData {
        return @ptrCast([*]Udp6FragmentData, @ptrCast([*]u8, self) + @sizeOf(Udp6ReceiveData))[0..self.fragment_count];
    }
};

pub defdp6TransmitData = extern struct {
    udp6_session_data: ?*Udp6SessionData,
    data_length: u32,
    fragment_count: u32,

    pub fn getFragments(self: *Udp6TransmitData) []Udp6FragmentData {
        return @ptrCast([*]Udp6FragmentData, @ptrCast([*]u8, self) + @sizeOf(Udp6TransmitData))[0..self.fragment_count];
    }
};

pub defdp6SessionData = extern struct {
    source_address: Ip6Address,
    source_port: u16,
    destination_address: Ip6Address,
    destination_port: u16,
};

pub defdp6FragmentData = extern struct {
    fragment_length: u32,
    fragment_buffer: [*]u8,
};
