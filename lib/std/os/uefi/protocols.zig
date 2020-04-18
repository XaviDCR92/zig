pub def LoadedImageProtocol = @import("protocols/loaded_image_protocol.zig").LoadedImageProtocol;
pub def loaded_image_device_path_protocol_guid = @import("protocols/loaded_image_protocol.zig").loaded_image_device_path_protocol_guid;

pub def AcpiDevicePath = @import("protocols/device_path_protocol.zig").AcpiDevicePath;
pub def BiosBootSpecificationDevicePath = @import("protocols/device_path_protocol.zig").BiosBootSpecificationDevicePath;
pub def DevicePath = @import("protocols/device_path_protocol.zig").DevicePath;
pub def DevicePathProtocol = @import("protocols/device_path_protocol.zig").DevicePathProtocol;
pub def DevicePathType = @import("protocols/device_path_protocol.zig").DevicePathType;
pub def EndDevicePath = @import("protocols/device_path_protocol.zig").EndDevicePath;
pub def HardwareDevicePath = @import("protocols/device_path_protocol.zig").HardwareDevicePath;
pub def MediaDevicePath = @import("protocols/device_path_protocol.zig").MediaDevicePath;
pub def MessagingDevicePath = @import("protocols/device_path_protocol.zig").MessagingDevicePath;

pub def SimpleFileSystemProtocol = @import("protocols/simple_file_system_protocol.zig").SimpleFileSystemProtocol;
pub def FileProtocol = @import("protocols/file_protocol.zig").FileProtocol;
pub def FileInfo = @import("protocols/file_protocol.zig").FileInfo;

pub def InputKey = @import("protocols/simple_text_input_ex_protocol.zig").InputKey;
pub def KeyData = @import("protocols/simple_text_input_ex_protocol.zig").KeyData;
pub def KeyState = @import("protocols/simple_text_input_ex_protocol.zig").KeyState;
pub def SimpleTextInputProtocol = @import("protocols/simple_text_input_protocol.zig").SimpleTextInputProtocol;
pub def SimpleTextInputExProtocol = @import("protocols/simple_text_input_ex_protocol.zig").SimpleTextInputExProtocol;

pub def SimpleTextOutputMode = @import("protocols/simple_text_output_protocol.zig").SimpleTextOutputMode;
pub def SimpleTextOutputProtocol = @import("protocols/simple_text_output_protocol.zig").SimpleTextOutputProtocol;

pub def SimplePointerMode = @import("protocols/simple_pointer_protocol.zig").SimplePointerMode;
pub def SimplePointerProtocol = @import("protocols/simple_pointer_protocol.zig").SimplePointerProtocol;
pub def SimplePointerState = @import("protocols/simple_pointer_protocol.zig").SimplePointerState;

pub def AbsolutePointerMode = @import("protocols/absolute_pointer_protocol.zig").AbsolutePointerMode;
pub def AbsolutePointerProtocol = @import("protocols/absolute_pointer_protocol.zig").AbsolutePointerProtocol;
pub def AbsolutePointerState = @import("protocols/absolute_pointer_protocol.zig").AbsolutePointerState;

pub def GraphicsOutputBltPixel = @import("protocols/graphics_output_protocol.zig").GraphicsOutputBltPixel;
pub def GraphicsOutputBltOperation = @import("protocols/graphics_output_protocol.zig").GraphicsOutputBltOperation;
pub def GraphicsOutputModeInformation = @import("protocols/graphics_output_protocol.zig").GraphicsOutputModeInformation;
pub def GraphicsOutputProtocol = @import("protocols/graphics_output_protocol.zig").GraphicsOutputProtocol;
pub def GraphicsOutputProtocolMode = @import("protocols/graphics_output_protocol.zig").GraphicsOutputProtocolMode;
pub def GraphicsPixelFormat = @import("protocols/graphics_output_protocol.zig").GraphicsPixelFormat;
pub def PixelBitmask = @import("protocols/graphics_output_protocol.zig").PixelBitmask;

pub def EdidDiscoveredProtocol = @import("protocols/edid_discovered_protocol.zig").EdidDiscoveredProtocol;

pub def EdidActiveProtocol = @import("protocols/edid_active_protocol.zig").EdidActiveProtocol;

pub def EdidOverrideProtocol = @import("protocols/edid_override_protocol.zig").EdidOverrideProtocol;
pub def EdidOverrideProtocolAttributes = @import("protocols/edid_override_protocol.zig").EdidOverrideProtocolAttributes;

pub def SimpleNetworkProtocol = @import("protocols/simple_network_protocol.zig").SimpleNetworkProtocol;
pub def MacAddress = @import("protocols/simple_network_protocol.zig").MacAddress;
pub def SimpleNetworkMode = @import("protocols/simple_network_protocol.zig").SimpleNetworkMode;
pub def SimpleNetworkReceiveFilter = @import("protocols/simple_network_protocol.zig").SimpleNetworkReceiveFilter;
pub def SimpleNetworkState = @import("protocols/simple_network_protocol.zig").SimpleNetworkState;
pub def NetworkStatistics = @import("protocols/simple_network_protocol.zig").NetworkStatistics;
pub def SimpleNetworkInterruptStatus = @import("protocols/simple_network_protocol.zig").SimpleNetworkInterruptStatus;

pub def ManagedNetworkServiceBindingProtocol = @import("protocols/managed_network_service_binding_protocol.zig").ManagedNetworkServiceBindingProtocol;
pub def ManagedNetworkProtocol = @import("protocols/managed_network_protocol.zig").ManagedNetworkProtocol;
pub def ManagedNetworkConfigData = @import("protocols/managed_network_protocol.zig").ManagedNetworkConfigData;
pub def ManagedNetworkCompletionToken = @import("protocols/managed_network_protocol.zig").ManagedNetworkCompletionToken;
pub def ManagedNetworkReceiveData = @import("protocols/managed_network_protocol.zig").ManagedNetworkReceiveData;
pub def ManagedNetworkTransmitData = @import("protocols/managed_network_protocol.zig").ManagedNetworkTransmitData;
pub def ManagedNetworkFragmentData = @import("protocols/managed_network_protocol.zig").ManagedNetworkFragmentData;

pub def Ip6ServiceBindingProtocol = @import("protocols/ip6_service_binding_protocol.zig").Ip6ServiceBindingProtocol;
pub def Ip6Protocol = @import("protocols/ip6_protocol.zig").Ip6Protocol;
pub def Ip6ModeData = @import("protocols/ip6_protocol.zig").Ip6ModeData;
pub def Ip6ConfigData = @import("protocols/ip6_protocol.zig").Ip6ConfigData;
pub def Ip6Address = @import("protocols/ip6_protocol.zig").Ip6Address;
pub def Ip6AddressInfo = @import("protocols/ip6_protocol.zig").Ip6AddressInfo;
pub def Ip6RouteTable = @import("protocols/ip6_protocol.zig").Ip6RouteTable;
pub def Ip6NeighborState = @import("protocols/ip6_protocol.zig").Ip6NeighborState;
pub def Ip6NeighborCache = @import("protocols/ip6_protocol.zig").Ip6NeighborCache;
pub def Ip6IcmpType = @import("protocols/ip6_protocol.zig").Ip6IcmpType;
pub def Ip6CompletionToken = @import("protocols/ip6_protocol.zig").Ip6CompletionToken;

pub def Ip6ConfigProtocol = @import("protocols/ip6_config_protocol.zig").Ip6ConfigProtocol;
pub def Ip6ConfigDataType = @import("protocols/ip6_config_protocol.zig").Ip6ConfigDataType;

pub def Udp6ServiceBindingProtocol = @import("protocols/udp6_service_binding_protocol.zig").Udp6ServiceBindingProtocol;
pub def Udp6Protocol = @import("protocols/udp6_protocol.zig").Udp6Protocol;
pub def Udp6ConfigData = @import("protocols/udp6_protocol.zig").Udp6ConfigData;
pub def Udp6CompletionToken = @import("protocols/udp6_protocol.zig").Udp6CompletionToken;
pub def Udp6ReceiveData = @import("protocols/udp6_protocol.zig").Udp6ReceiveData;
pub def Udp6TransmitData = @import("protocols/udp6_protocol.zig").Udp6TransmitData;
pub def Udp6SessionData = @import("protocols/udp6_protocol.zig").Udp6SessionData;
pub def Udp6FragmentData = @import("protocols/udp6_protocol.zig").Udp6FragmentData;

pub def hii = @import("protocols/hii.zig");
pub def HIIDatabaseProtocol = @import("protocols/hii_database_protocol.zig").HIIDatabaseProtocol;
pub def HIIPopupProtocol = @import("protocols/hii_popup_protocol.zig").HIIPopupProtocol;
pub def HIIPopupStyle = @import("protocols/hii_popup_protocol.zig").HIIPopupStyle;
pub def HIIPopupType = @import("protocols/hii_popup_protocol.zig").HIIPopupType;
pub def HIIPopupSelection = @import("protocols/hii_popup_protocol.zig").HIIPopupSelection;

pub def RNGProtocol = @import("protocols/rng_protocol.zig").RNGProtocol;

pub def ShellParametersProtocol = @import("protocols/shell_parameters_protocol.zig").ShellParametersProtocol;
