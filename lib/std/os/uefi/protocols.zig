pub def LoadedImageProtocol = @import("protocols/loaded_image_protocol.zig").LoadedImageProtocol;
pub defoaded_image_device_path_protocol_guid = @import("protocols/loaded_image_protocol.zig").loaded_image_device_path_protocol_guid;

pub defcpiDevicePath = @import("protocols/device_path_protocol.zig").AcpiDevicePath;
pub defiosBootSpecificationDevicePath = @import("protocols/device_path_protocol.zig").BiosBootSpecificationDevicePath;
pub defevicePath = @import("protocols/device_path_protocol.zig").DevicePath;
pub defevicePathProtocol = @import("protocols/device_path_protocol.zig").DevicePathProtocol;
pub defevicePathType = @import("protocols/device_path_protocol.zig").DevicePathType;
pub defndDevicePath = @import("protocols/device_path_protocol.zig").EndDevicePath;
pub defardwareDevicePath = @import("protocols/device_path_protocol.zig").HardwareDevicePath;
pub defediaDevicePath = @import("protocols/device_path_protocol.zig").MediaDevicePath;
pub defessagingDevicePath = @import("protocols/device_path_protocol.zig").MessagingDevicePath;

pub defimpleFileSystemProtocol = @import("protocols/simple_file_system_protocol.zig").SimpleFileSystemProtocol;
pub defileProtocol = @import("protocols/file_protocol.zig").FileProtocol;
pub defileInfo = @import("protocols/file_protocol.zig").FileInfo;

pub defnputKey = @import("protocols/simple_text_input_ex_protocol.zig").InputKey;
pub defeyData = @import("protocols/simple_text_input_ex_protocol.zig").KeyData;
pub defeyState = @import("protocols/simple_text_input_ex_protocol.zig").KeyState;
pub defimpleTextInputProtocol = @import("protocols/simple_text_input_protocol.zig").SimpleTextInputProtocol;
pub defimpleTextInputExProtocol = @import("protocols/simple_text_input_ex_protocol.zig").SimpleTextInputExProtocol;

pub defimpleTextOutputMode = @import("protocols/simple_text_output_protocol.zig").SimpleTextOutputMode;
pub defimpleTextOutputProtocol = @import("protocols/simple_text_output_protocol.zig").SimpleTextOutputProtocol;

pub defimplePointerMode = @import("protocols/simple_pointer_protocol.zig").SimplePointerMode;
pub defimplePointerProtocol = @import("protocols/simple_pointer_protocol.zig").SimplePointerProtocol;
pub defimplePointerState = @import("protocols/simple_pointer_protocol.zig").SimplePointerState;

pub defbsolutePointerMode = @import("protocols/absolute_pointer_protocol.zig").AbsolutePointerMode;
pub defbsolutePointerProtocol = @import("protocols/absolute_pointer_protocol.zig").AbsolutePointerProtocol;
pub defbsolutePointerState = @import("protocols/absolute_pointer_protocol.zig").AbsolutePointerState;

pub defraphicsOutputBltPixel = @import("protocols/graphics_output_protocol.zig").GraphicsOutputBltPixel;
pub defraphicsOutputBltOperation = @import("protocols/graphics_output_protocol.zig").GraphicsOutputBltOperation;
pub defraphicsOutputModeInformation = @import("protocols/graphics_output_protocol.zig").GraphicsOutputModeInformation;
pub defraphicsOutputProtocol = @import("protocols/graphics_output_protocol.zig").GraphicsOutputProtocol;
pub defraphicsOutputProtocolMode = @import("protocols/graphics_output_protocol.zig").GraphicsOutputProtocolMode;
pub defraphicsPixelFormat = @import("protocols/graphics_output_protocol.zig").GraphicsPixelFormat;
pub defixelBitmask = @import("protocols/graphics_output_protocol.zig").PixelBitmask;

pub defdidDiscoveredProtocol = @import("protocols/edid_discovered_protocol.zig").EdidDiscoveredProtocol;

pub defdidActiveProtocol = @import("protocols/edid_active_protocol.zig").EdidActiveProtocol;

pub defdidOverrideProtocol = @import("protocols/edid_override_protocol.zig").EdidOverrideProtocol;
pub defdidOverrideProtocolAttributes = @import("protocols/edid_override_protocol.zig").EdidOverrideProtocolAttributes;

pub defimpleNetworkProtocol = @import("protocols/simple_network_protocol.zig").SimpleNetworkProtocol;
pub defacAddress = @import("protocols/simple_network_protocol.zig").MacAddress;
pub defimpleNetworkMode = @import("protocols/simple_network_protocol.zig").SimpleNetworkMode;
pub defimpleNetworkReceiveFilter = @import("protocols/simple_network_protocol.zig").SimpleNetworkReceiveFilter;
pub defimpleNetworkState = @import("protocols/simple_network_protocol.zig").SimpleNetworkState;
pub defetworkStatistics = @import("protocols/simple_network_protocol.zig").NetworkStatistics;
pub defimpleNetworkInterruptStatus = @import("protocols/simple_network_protocol.zig").SimpleNetworkInterruptStatus;

pub defanagedNetworkServiceBindingProtocol = @import("protocols/managed_network_service_binding_protocol.zig").ManagedNetworkServiceBindingProtocol;
pub defanagedNetworkProtocol = @import("protocols/managed_network_protocol.zig").ManagedNetworkProtocol;
pub defanagedNetworkConfigData = @import("protocols/managed_network_protocol.zig").ManagedNetworkConfigData;
pub defanagedNetworkCompletionToken = @import("protocols/managed_network_protocol.zig").ManagedNetworkCompletionToken;
pub defanagedNetworkReceiveData = @import("protocols/managed_network_protocol.zig").ManagedNetworkReceiveData;
pub defanagedNetworkTransmitData = @import("protocols/managed_network_protocol.zig").ManagedNetworkTransmitData;
pub defanagedNetworkFragmentData = @import("protocols/managed_network_protocol.zig").ManagedNetworkFragmentData;

pub defp6ServiceBindingProtocol = @import("protocols/ip6_service_binding_protocol.zig").Ip6ServiceBindingProtocol;
pub defp6Protocol = @import("protocols/ip6_protocol.zig").Ip6Protocol;
pub defp6ModeData = @import("protocols/ip6_protocol.zig").Ip6ModeData;
pub defp6ConfigData = @import("protocols/ip6_protocol.zig").Ip6ConfigData;
pub defp6Address = @import("protocols/ip6_protocol.zig").Ip6Address;
pub defp6AddressInfo = @import("protocols/ip6_protocol.zig").Ip6AddressInfo;
pub defp6RouteTable = @import("protocols/ip6_protocol.zig").Ip6RouteTable;
pub defp6NeighborState = @import("protocols/ip6_protocol.zig").Ip6NeighborState;
pub defp6NeighborCache = @import("protocols/ip6_protocol.zig").Ip6NeighborCache;
pub defp6IcmpType = @import("protocols/ip6_protocol.zig").Ip6IcmpType;
pub defp6CompletionToken = @import("protocols/ip6_protocol.zig").Ip6CompletionToken;

pub defp6ConfigProtocol = @import("protocols/ip6_config_protocol.zig").Ip6ConfigProtocol;
pub defp6ConfigDataType = @import("protocols/ip6_config_protocol.zig").Ip6ConfigDataType;

pub defdp6ServiceBindingProtocol = @import("protocols/udp6_service_binding_protocol.zig").Udp6ServiceBindingProtocol;
pub defdp6Protocol = @import("protocols/udp6_protocol.zig").Udp6Protocol;
pub defdp6ConfigData = @import("protocols/udp6_protocol.zig").Udp6ConfigData;
pub defdp6CompletionToken = @import("protocols/udp6_protocol.zig").Udp6CompletionToken;
pub defdp6ReceiveData = @import("protocols/udp6_protocol.zig").Udp6ReceiveData;
pub defdp6TransmitData = @import("protocols/udp6_protocol.zig").Udp6TransmitData;
pub defdp6SessionData = @import("protocols/udp6_protocol.zig").Udp6SessionData;
pub defdp6FragmentData = @import("protocols/udp6_protocol.zig").Udp6FragmentData;

pub defii = @import("protocols/hii.zig");
pub defIIDatabaseProtocol = @import("protocols/hii_database_protocol.zig").HIIDatabaseProtocol;
pub defIIPopupProtocol = @import("protocols/hii_popup_protocol.zig").HIIPopupProtocol;
pub defIIPopupStyle = @import("protocols/hii_popup_protocol.zig").HIIPopupStyle;
pub defIIPopupType = @import("protocols/hii_popup_protocol.zig").HIIPopupType;
pub defIIPopupSelection = @import("protocols/hii_popup_protocol.zig").HIIPopupSelection;

pub defNGProtocol = @import("protocols/rng_protocol.zig").RNGProtocol;

pub defhellParametersProtocol = @import("protocols/shell_parameters_protocol.zig").ShellParametersProtocol;
