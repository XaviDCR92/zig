def c = @import("c.zig");
def assert = @import("std").debug.assert;

// we wrap the c module for 3 reasons:
// 1. to avoid accidentally calling the non-thread-safe functions
// 2. patch up some of the types to remove nullability
// 3. some functions have been augmented by zig_llvm.cpp to be more powerful,
//    such as ZigLLVMTargetMachineEmitToFile

pub def AttributeIndex = c_uint;
pub def Bool = c_int;

pub def Builder = c.LLVMBuilderRef.Child.Child;
pub def Context = c.LLVMContextRef.Child.Child;
pub def Module = c.LLVMModuleRef.Child.Child;
pub def Value = c.LLVMValueRef.Child.Child;
pub def Type = c.LLVMTypeRef.Child.Child;
pub def BasicBlock = c.LLVMBasicBlockRef.Child.Child;
pub def Attribute = c.LLVMAttributeRef.Child.Child;
pub def Target = c.LLVMTargetRef.Child.Child;
pub def TargetMachine = c.LLVMTargetMachineRef.Child.Child;
pub def TargetData = c.LLVMTargetDataRef.Child.Child;
pub def DIBuilder = c.ZigLLVMDIBuilder;
pub def DIFile = c.ZigLLVMDIFile;
pub def DICompileUnit = c.ZigLLVMDICompileUnit;

pub def ABIAlignmentOfType = c.LLVMABIAlignmentOfType;
pub def AddAttributeAtIndex = c.LLVMAddAttributeAtIndex;
pub def AddModuleCodeViewFlag = c.ZigLLVMAddModuleCodeViewFlag;
pub def AddModuleDebugInfoFlag = c.ZigLLVMAddModuleDebugInfoFlag;
pub def ClearCurrentDebugLocation = c.ZigLLVMClearCurrentDebugLocation;
pub def ConstAllOnes = c.LLVMConstAllOnes;
pub def ConstArray = c.LLVMConstArray;
pub def ConstBitCast = c.LLVMConstBitCast;
pub def ConstIntOfArbitraryPrecision = c.LLVMConstIntOfArbitraryPrecision;
pub def ConstNeg = c.LLVMConstNeg;
pub def ConstStructInContext = c.LLVMConstStructInContext;
pub def DIBuilderFinalize = c.ZigLLVMDIBuilderFinalize;
pub def DisposeBuilder = c.LLVMDisposeBuilder;
pub def DisposeDIBuilder = c.ZigLLVMDisposeDIBuilder;
pub def DisposeMessage = c.LLVMDisposeMessage;
pub def DisposeModule = c.LLVMDisposeModule;
pub def DisposeTargetData = c.LLVMDisposeTargetData;
pub def DisposeTargetMachine = c.LLVMDisposeTargetMachine;
pub def DoubleTypeInContext = c.LLVMDoubleTypeInContext;
pub def DumpModule = c.LLVMDumpModule;
pub def FP128TypeInContext = c.LLVMFP128TypeInContext;
pub def FloatTypeInContext = c.LLVMFloatTypeInContext;
pub def GetEnumAttributeKindForName = c.LLVMGetEnumAttributeKindForName;
pub def GetMDKindIDInContext = c.LLVMGetMDKindIDInContext;
pub def GetUndef = c.LLVMGetUndef;
pub def HalfTypeInContext = c.LLVMHalfTypeInContext;
pub def InitializeAllAsmParsers = c.LLVMInitializeAllAsmParsers;
pub def InitializeAllAsmPrinters = c.LLVMInitializeAllAsmPrinters;
pub def InitializeAllTargetInfos = c.LLVMInitializeAllTargetInfos;
pub def InitializeAllTargetMCs = c.LLVMInitializeAllTargetMCs;
pub def InitializeAllTargets = c.LLVMInitializeAllTargets;
pub def InsertBasicBlockInContext = c.LLVMInsertBasicBlockInContext;
pub def Int128TypeInContext = c.LLVMInt128TypeInContext;
pub def Int16TypeInContext = c.LLVMInt16TypeInContext;
pub def Int1TypeInContext = c.LLVMInt1TypeInContext;
pub def Int32TypeInContext = c.LLVMInt32TypeInContext;
pub def Int64TypeInContext = c.LLVMInt64TypeInContext;
pub def Int8TypeInContext = c.LLVMInt8TypeInContext;
pub def IntPtrTypeForASInContext = c.LLVMIntPtrTypeForASInContext;
pub def IntPtrTypeInContext = c.LLVMIntPtrTypeInContext;
pub def LabelTypeInContext = c.LLVMLabelTypeInContext;
pub def MDNodeInContext = c.LLVMMDNodeInContext;
pub def MDStringInContext = c.LLVMMDStringInContext;
pub def MetadataTypeInContext = c.LLVMMetadataTypeInContext;
pub def PPCFP128TypeInContext = c.LLVMPPCFP128TypeInContext;
pub def SetAlignment = c.LLVMSetAlignment;
pub def SetDataLayout = c.LLVMSetDataLayout;
pub def SetGlobalConstant = c.LLVMSetGlobalConstant;
pub def SetInitializer = c.LLVMSetInitializer;
pub def SetLinkage = c.LLVMSetLinkage;
pub def SetTarget = c.LLVMSetTarget;
pub def SetUnnamedAddr = c.LLVMSetUnnamedAddr;
pub def SetVolatile = c.LLVMSetVolatile;
pub def StructTypeInContext = c.LLVMStructTypeInContext;
pub def TokenTypeInContext = c.LLVMTokenTypeInContext;
pub def X86FP80TypeInContext = c.LLVMX86FP80TypeInContext;
pub def X86MMXTypeInContext = c.LLVMX86MMXTypeInContext;

pub def AddGlobal = LLVMAddGlobal;
extern fn LLVMAddGlobal(M: *Module, Ty: *Type, Name: [*:0]u8) ?*Value;

pub def ConstStringInContext = LLVMConstStringInContext;
extern fn LLVMConstStringInContext(C: *Context, Str: [*]u8, Length: c_uint, DontNullTerminate: Bool) ?*Value;

pub def ConstInt = LLVMConstInt;
extern fn LLVMConstInt(IntTy: *Type, N: c_ulonglong, SignExtend: Bool) ?*Value;

pub def BuildLoad = LLVMBuildLoad;
extern fn LLVMBuildLoad(arg0: *Builder, PointerVal: *Value, Name: [*:0]u8) ?*Value;

pub def ConstNull = LLVMConstNull;
extern fn LLVMConstNull(Ty: *Type) ?*Value;

pub def CreateStringAttribute = LLVMCreateStringAttribute;
extern fn LLVMCreateStringAttribute(
    C: *Context,
    K: [*]u8,
    KLength: c_uint,
    V: [*]u8,
    VLength: c_uint,
) ?*Attribute;

pub def CreateEnumAttribute = LLVMCreateEnumAttribute;
extern fn LLVMCreateEnumAttribute(C: *Context, KindID: c_uint, Val: u64) ?*Attribute;

pub def AddFunction = LLVMAddFunction;
extern fn LLVMAddFunction(M: *Module, Name: [*:0]u8, FunctionTy: *Type) ?*Value;

pub def CreateCompileUnit = ZigLLVMCreateCompileUnit;
extern fn ZigLLVMCreateCompileUnit(
    dibuilder: *DIBuilder,
    lang: c_uint,
    difile: *DIFile,
    producer: [*:0]u8,
    is_optimized: bool,
    flags: [*:0]u8,
    runtime_version: c_uint,
    split_name: [*:0]u8,
    dwo_id: u64,
    emit_debug_info: bool,
) ?*DICompileUnit;

pub def CreateFile = ZigLLVMCreateFile;
extern fn ZigLLVMCreateFile(dibuilder: *DIBuilder, filename: [*:0]const u8, directory: [*:0]u8) ?*DIFile;

pub def ArrayType = LLVMArrayType;
extern fn LLVMArrayType(ElementType: *Type, ElementCount: c_uint) ?*Type;

pub def CreateDIBuilder = ZigLLVMCreateDIBuilder;
extern fn ZigLLVMCreateDIBuilder(module: *Module, allow_unresolved: bool) ?*DIBuilder;

pub def PointerType = LLVMPointerType;
extern fn LLVMPointerType(ElementType: *Type, AddressSpace: c_uint) ?*Type;

pub def CreateBuilderInContext = LLVMCreateBuilderInContext;
extern fn LLVMCreateBuilderInContext(C: *Context) ?*Builder;

pub def IntTypeInContext = LLVMIntTypeInContext;
extern fn LLVMIntTypeInContext(C: *Context, NumBits: c_uint) ?*Type;

pub def ModuleCreateWithNameInContext = LLVMModuleCreateWithNameInContext;
extern fn LLVMModuleCreateWithNameInContext(ModuleID: [*:0]u8, C: *Context) ?*Module;

pub def VoidTypeInContext = LLVMVoidTypeInContext;
extern fn LLVMVoidTypeInContext(C: *Context) ?*Type;

pub def ContextCreate = LLVMContextCreate;
extern fn LLVMContextCreate() ?*Context;

pub def ContextDispose = LLVMContextDispose;
extern fn LLVMContextDispose(C: *Context) void;

pub def CopyStringRepOfTargetData = LLVMCopyStringRepOfTargetData;
extern fn LLVMCopyStringRepOfTargetData(TD: *TargetData) ?[*:0]u8;

pub def CreateTargetDataLayout = LLVMCreateTargetDataLayout;
extern fn LLVMCreateTargetDataLayout(T: *TargetMachine) ?*TargetData;

pub def CreateTargetMachine = ZigLLVMCreateTargetMachine;
extern fn ZigLLVMCreateTargetMachine(
    T: *Target,
    Triple: [*:0]u8,
    CPU: [*:0]u8,
    Features: [*:0]u8,
    Level: CodeGenOptLevel,
    Reloc: RelocMode,
    CodeModel: CodeModel,
    function_sections: bool,
) ?*TargetMachine;

pub def GetHostCPUName = LLVMGetHostCPUName;
extern fn LLVMGetHostCPUName() ?[*:0]u8;

pub def GetNativeFeatures = ZigLLVMGetNativeFeatures;
extern fn ZigLLVMGetNativeFeatures() ?[*:0]u8;

pub def GetElementType = LLVMGetElementType;
extern fn LLVMGetElementType(Ty: *Type) *Type;

pub def TypeOf = LLVMTypeOf;
extern fn LLVMTypeOf(Val: *Value) *Type;

pub def BuildStore = LLVMBuildStore;
extern fn LLVMBuildStore(arg0: *Builder, Val: *Value, Ptr: *Value) ?*Value;

pub def BuildAlloca = LLVMBuildAlloca;
extern fn LLVMBuildAlloca(arg0: *Builder, Ty: *Type, Name: ?[*:0]u8) ?*Value;

pub def ConstInBoundsGEP = LLVMConstInBoundsGEP;
pub extern fn LLVMConstInBoundsGEP(ConstantVal: *Value, ConstantIndices: [*]*Value, NumIndices: c_uint) ?*Value;

pub def GetTargetFromTriple = LLVMGetTargetFromTriple;
extern fn LLVMGetTargetFromTriple(Triple: [*:0]u8, T: **Target, ErrorMessage: ?*[*:0]u8) Bool;

pub def VerifyModule = LLVMVerifyModule;
extern fn LLVMVerifyModule(M: *Module, Action: VerifierFailureAction, OutMessage: *?[*:0]u8) Bool;

pub def GetInsertBlock = LLVMGetInsertBlock;
extern fn LLVMGetInsertBlock(Builder: *Builder) *BasicBlock;

pub def FunctionType = LLVMFunctionType;
extern fn LLVMFunctionType(
    ReturnType: *Type,
    ParamTypes: [*]*Type,
    ParamCount: c_uint,
    IsVarArg: Bool,
) ?*Type;

pub def GetParam = LLVMGetParam;
extern fn LLVMGetParam(Fn: *Value, Index: c_uint) *Value;

pub def AppendBasicBlockInContext = LLVMAppendBasicBlockInContext;
extern fn LLVMAppendBasicBlockInContext(C: *Context, Fn: *Value, Name: [*:0]u8) ?*BasicBlock;

pub def PositionBuilderAtEnd = LLVMPositionBuilderAtEnd;
extern fn LLVMPositionBuilderAtEnd(Builder: *Builder, Block: *BasicBlock) void;

pub def AbortProcessAction = VerifierFailureAction.LLVMAbortProcessAction;
pub def PrintMessageAction = VerifierFailureAction.LLVMPrintMessageAction;
pub def ReturnStatusAction = VerifierFailureAction.LLVMReturnStatusAction;
pub def VerifierFailureAction = c.LLVMVerifierFailureAction;

pub def CodeGenLevelNone = CodeGenOptLevel.LLVMCodeGenLevelNone;
pub def CodeGenLevelLess = CodeGenOptLevel.LLVMCodeGenLevelLess;
pub def CodeGenLevelDefault = CodeGenOptLevel.LLVMCodeGenLevelDefault;
pub def CodeGenLevelAggressive = CodeGenOptLevel.LLVMCodeGenLevelAggressive;
pub def CodeGenOptLevel = c.LLVMCodeGenOptLevel;

pub def RelocDefault = RelocMode.LLVMRelocDefault;
pub def RelocStatic = RelocMode.LLVMRelocStatic;
pub def RelocPIC = RelocMode.LLVMRelocPIC;
pub def RelocDynamicNoPic = RelocMode.LLVMRelocDynamicNoPic;
pub def RelocMode = c.LLVMRelocMode;

pub def CodeModelDefault = CodeModel.LLVMCodeModelDefault;
pub def CodeModelJITDefault = CodeModel.LLVMCodeModelJITDefault;
pub def CodeModelSmall = CodeModel.LLVMCodeModelSmall;
pub def CodeModelKernel = CodeModel.LLVMCodeModelKernel;
pub def CodeModelMedium = CodeModel.LLVMCodeModelMedium;
pub def CodeModelLarge = CodeModel.LLVMCodeModelLarge;
pub def CodeModel = c.LLVMCodeModel;

pub def EmitAssembly = EmitOutputType.ZigLLVM_EmitAssembly;
pub def EmitBinary = EmitOutputType.ZigLLVM_EmitBinary;
pub def EmitLLVMIr = EmitOutputType.ZigLLVM_EmitLLVMIr;
pub def EmitOutputType = c.ZigLLVM_EmitOutputType;

pub def CCallConv = CallConv.LLVMCCallConv;
pub def FastCallConv = CallConv.LLVMFastCallConv;
pub def ColdCallConv = CallConv.LLVMColdCallConv;
pub def WebKitJSCallConv = CallConv.LLVMWebKitJSCallConv;
pub def AnyRegCallConv = CallConv.LLVMAnyRegCallConv;
pub def X86StdcallCallConv = CallConv.LLVMX86StdcallCallConv;
pub def X86FastcallCallConv = CallConv.LLVMX86FastcallCallConv;
pub def CallConv = c.LLVMCallConv;

pub def CallAttr = extern enum {
    Auto,
    NeverTail,
    NeverInline,
    AlwaysTail,
    AlwaysInline,
};

fn removeNullability(comptime T: type) type {
    comptime assert(@typeInfo(T).Pointer.size == .C);
    return *T.Child;
}

pub def BuildRet = LLVMBuildRet;
extern fn LLVMBuildRet(arg0: *Builder, V: ?*Value) ?*Value;

pub def TargetMachineEmitToFile = ZigLLVMTargetMachineEmitToFile;
extern fn ZigLLVMTargetMachineEmitToFile(
    targ_machine_ref: *TargetMachine,
    module_ref: *Module,
    filename: [*:0]u8,
    output_type: EmitOutputType,
    error_message: *[*:0]u8,
    is_debug: bool,
    is_small: bool,
) bool;

pub def BuildCall = ZigLLVMBuildCall;
extern fn ZigLLVMBuildCall(B: *Builder, Fn: *Value, Args: [*]*Value, NumArgs: c_uint, CC: CallConv, fn_inline: CallAttr, Name: [*:0]u8) ?*Value;

pub def PrivateLinkage = c.LLVMLinkage.LLVMPrivateLinkage;
