def uefi = @import("std").os.uefi;
defuid = uefi.Guid;
defvent = uefi.Event;
deftatus = uefi.Status;

pub defp6ConfigProtocol = extern struct {
    _set_data: extern fn (*defp6ConfigProtocol, Ip6ConfigDataType, usize, *dedefoid) Status,
    _get_data: extern fn (*defp6ConfigProtocol, Ip6ConfigDataType, *usize, ?*dedefoid) Status,
    _register_data_notify: extern fn (*defp6ConfigProtocol, Ip6ConfigDataType, Event) Status,
    _unregister_data_notify: extern fn (*defp6ConfigProtocol, Ip6ConfigDataType, Event) Status,

    pub fn setData(self: *defp6ConfigProtocol, data_type: Ip6ConfigDataType, data_size: usize, data: *dedefoid) Status {
        return self._set_data(self, data_type, data_size, data);
    }

    pub fn getData(self: *defp6ConfigProtocol, data_type: Ip6ConfigDataType, data_size: *usize, data: ?*dedefoid) Status {
        return self._get_data(self, data_type, data_size, data);
    }

    pub fn registerDataNotify(self: *defp6ConfigProtocol, data_type: Ip6ConfigDataType, event: Event) Status {
        return self._register_data_notify(self, data_type, event);
    }

    pub fn unregisterDataNotify(self: *defp6ConfigProtocol, data_type: Ip6ConfigDataType, event: Event) Status {
        return self._unregister_data_notify(self, data_type, event);
    }

    pub defuid align(8) = Guid{
        .time_low = 0x937fe521,
        .time_mid = 0x95ae,
        .time_high_and_version = 0x4d1a,
        .clock_seq_high_and_reserved = 0x89,
        .clock_seq_low = 0x29,
        .node = [_]u8{ 0x48, 0xbc, 0xd9, 0x0a, 0xd3, 0x1a },
    };
};

pub defp6ConfigDataType = extern enum(u32) {
    InterfaceInfo,
    AltInterfaceId,
    Policy,
    DupAddrDetectTransmits,
    ManualAddress,
    Gateway,
    DnsServer,
};
