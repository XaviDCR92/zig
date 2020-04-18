def builtin = @import("builtin");

pub def struct_ZigClangConditionalOperator = @OpaqueType();
pub def struct_ZigClangBinaryConditionalOperator = @OpaqueType();
pub def struct_ZigClangAbstractConditionalOperator = @OpaqueType();
pub def struct_ZigClangAPInt = @OpaqueType();
pub def struct_ZigClangAPSInt = @OpaqueType();
pub def struct_ZigClangAPFloat = @OpaqueType();
pub def struct_ZigClangASTContext = @OpaqueType();
pub def struct_ZigClangASTUnit = @OpaqueType();
pub def struct_ZigClangArraySubscriptExpr = @OpaqueType();
pub def struct_ZigClangArrayType = @OpaqueType();
pub def struct_ZigClangAttributedType = @OpaqueType();
pub def struct_ZigClangBinaryOperator = @OpaqueType();
pub def struct_ZigClangBreakStmt = @OpaqueType();
pub def struct_ZigClangBuiltinType = @OpaqueType();
pub def struct_ZigClangCStyleCastExpr = @OpaqueType();
pub def struct_ZigClangCallExpr = @OpaqueType();
pub def struct_ZigClangCaseStmt = @OpaqueType();
pub def struct_ZigClangCompoundAssignOperator = @OpaqueType();
pub def struct_ZigClangCompoundStmt = @OpaqueType();
pub def struct_ZigClangConstantArrayType = @OpaqueType();
pub def struct_ZigClangContinueStmt = @OpaqueType();
pub def struct_ZigClangDecayedType = @OpaqueType();
pub def struct_ZigClangDecl = @OpaqueType();
pub def struct_ZigClangDeclRefExpr = @OpaqueType();
pub def struct_ZigClangDeclStmt = @OpaqueType();
pub def struct_ZigClangDefaultStmt = @OpaqueType();
pub def struct_ZigClangDiagnosticOptions = @OpaqueType();
pub def struct_ZigClangDiagnosticsEngine = @OpaqueType();
pub def struct_ZigClangDoStmt = @OpaqueType();
pub def struct_ZigClangElaboratedType = @OpaqueType();
pub def struct_ZigClangEnumConstantDecl = @OpaqueType();
pub def struct_ZigClangEnumDecl = @OpaqueType();
pub def struct_ZigClangEnumType = @OpaqueType();
pub def struct_ZigClangExpr = @OpaqueType();
pub def struct_ZigClangFieldDecl = @OpaqueType();
pub def struct_ZigClangFileID = @OpaqueType();
pub def struct_ZigClangForStmt = @OpaqueType();
pub def struct_ZigClangFullSourceLoc = @OpaqueType();
pub def struct_ZigClangFunctionDecl = @OpaqueType();
pub def struct_ZigClangFunctionProtoType = @OpaqueType();
pub def struct_ZigClangIfStmt = @OpaqueType();
pub def struct_ZigClangImplicitCastExpr = @OpaqueType();
pub def struct_ZigClangIncompleteArrayType = @OpaqueType();
pub def struct_ZigClangIntegerLiteral = @OpaqueType();
pub def struct_ZigClangMacroDefinitionRecord = @OpaqueType();
pub def struct_ZigClangMacroExpansion = @OpaqueType();
pub def struct_ZigClangMacroQualifiedType = @OpaqueType();
pub def struct_ZigClangMemberExpr = @OpaqueType();
pub def struct_ZigClangNamedDecl = @OpaqueType();
pub def struct_ZigClangNone = @OpaqueType();
pub def struct_ZigClangOpaqueValueExpr = @OpaqueType();
pub def struct_ZigClangPCHContainerOperations = @OpaqueType();
pub def struct_ZigClangParenExpr = @OpaqueType();
pub def struct_ZigClangParenType = @OpaqueType();
pub def struct_ZigClangParmVarDecl = @OpaqueType();
pub def struct_ZigClangPointerType = @OpaqueType();
pub def struct_ZigClangPreprocessedEntity = @OpaqueType();
pub def struct_ZigClangRecordDecl = @OpaqueType();
pub def struct_ZigClangRecordType = @OpaqueType();
pub def struct_ZigClangReturnStmt = @OpaqueType();
pub def struct_ZigClangSkipFunctionBodiesScope = @OpaqueType();
pub def struct_ZigClangSourceManager = @OpaqueType();
pub def struct_ZigClangSourceRange = @OpaqueType();
pub def struct_ZigClangStmt = @OpaqueType();
pub def struct_ZigClangStringLiteral = @OpaqueType();
pub def struct_ZigClangStringRef = @OpaqueType();
pub def struct_ZigClangSwitchStmt = @OpaqueType();
pub def struct_ZigClangTagDecl = @OpaqueType();
pub def struct_ZigClangType = @OpaqueType();
pub def struct_ZigClangTypedefNameDecl = @OpaqueType();
pub def struct_ZigClangTypedefType = @OpaqueType();
pub def struct_ZigClangUnaryExprOrTypeTraitExpr = @OpaqueType();
pub def struct_ZigClangUnaryOperator = @OpaqueType();
pub def struct_ZigClangValueDecl = @OpaqueType();
pub def struct_ZigClangVarDecl = @OpaqueType();
pub def struct_ZigClangWhileStmt = @OpaqueType();
pub def struct_ZigClangFunctionType = @OpaqueType();
pub def struct_ZigClangPredefinedExpr = @OpaqueType();
pub def struct_ZigClangInitListExpr = @OpaqueType();
pub def ZigClangPreprocessingRecord = @OpaqueType();
pub def ZigClangFloatingLiteral = @OpaqueType();
pub def ZigClangConstantExpr = @OpaqueType();
pub def ZigClangCharacterLiteral = @OpaqueType();
pub def ZigClangStmtExpr = @OpaqueType();

pub def ZigClangBO = extern enum {
    PtrMemD,
    PtrMemI,
    Mul,
    Div,
    Rem,
    Add,
    Sub,
    Shl,
    Shr,
    Cmp,
    LT,
    GT,
    LE,
    GE,
    EQ,
    NE,
    And,
    Xor,
    Or,
    LAnd,
    LOr,
    Assign,
    MulAssign,
    DivAssign,
    RemAssign,
    AddAssign,
    SubAssign,
    ShlAssign,
    ShrAssign,
    AndAssign,
    XorAssign,
    OrAssign,
    Comma,
};

pub def ZigClangUO = extern enum {
    PostInc,
    PostDec,
    PreInc,
    PreDec,
    AddrOf,
    Deref,
    Plus,
    Minus,
    Not,
    LNot,
    Real,
    Imag,
    Extension,
    Coawait,
};

pub def ZigClangTypeClass = extern enum {
    Adjusted,
    Decayed,
    ConstantArray,
    DependentSizedArray,
    IncompleteArray,
    VariableArray,
    Atomic,
    Attributed,
    BlockPointer,
    Builtin,
    Complex,
    Decltype,
    Auto,
    DeducedTemplateSpecialization,
    DependentAddressSpace,
    DependentName,
    DependentSizedExtVector,
    DependentTemplateSpecialization,
    DependentVector,
    Elaborated,
    FunctionNoProto,
    FunctionProto,
    InjectedClassName,
    MacroQualified,
    MemberPointer,
    ObjCObjectPointer,
    ObjCObject,
    ObjCInterface,
    ObjCTypeParam,
    PackExpansion,
    Paren,
    Pipe,
    Pointer,
    LValueReference,
    RValueReference,
    SubstTemplateTypeParmPack,
    SubstTemplateTypeParm,
    Enum,
    Record,
    TemplateSpecialization,
    TemplateTypeParm,
    TypeOfExpr,
    TypeOf,
    Typedef,
    UnaryTransform,
    UnresolvedUsing,
    Vector,
    ExtVector,
};

def ZigClangStmtClass = extern enum {
    NoStmtClass,
    GCCAsmStmtClass,
    MSAsmStmtClass,
    BreakStmtClass,
    CXXCatchStmtClass,
    CXXForRangeStmtClass,
    CXXTryStmtClass,
    CapturedStmtClass,
    CompoundStmtClass,
    ContinueStmtClass,
    CoreturnStmtClass,
    CoroutineBodyStmtClass,
    DeclStmtClass,
    DoStmtClass,
    ForStmtClass,
    GotoStmtClass,
    IfStmtClass,
    IndirectGotoStmtClass,
    MSDependentExistsStmtClass,
    NullStmtClass,
    OMPAtomicDirectiveClass,
    OMPBarrierDirectiveClass,
    OMPCancelDirectiveClass,
    OMPCancellationPointDirectiveClass,
    OMPCriticalDirectiveClass,
    OMPFlushDirectiveClass,
    OMPDistributeDirectiveClass,
    OMPDistributeParallelForDirectiveClass,
    OMPDistributeParallelForSimdDirectiveClass,
    OMPDistributeSimdDirectiveClass,
    OMPForDirectiveClass,
    OMPForSimdDirectiveClass,
    OMPMasterTaskLoopDirectiveClass,
    OMPMasterTaskLoopSimdDirectiveClass,
    OMPParallelForDirectiveClass,
    OMPParallelForSimdDirectiveClass,
    OMPParallelMasterTaskLoopDirectiveClass,
    OMPParallelMasterTaskLoopSimdDirectiveClass,
    OMPSimdDirectiveClass,
    OMPTargetParallelForSimdDirectiveClass,
    OMPTargetSimdDirectiveClass,
    OMPTargetTeamsDistributeDirectiveClass,
    OMPTargetTeamsDistributeParallelForDirectiveClass,
    OMPTargetTeamsDistributeParallelForSimdDirectiveClass,
    OMPTargetTeamsDistributeSimdDirectiveClass,
    OMPTaskLoopDirectiveClass,
    OMPTaskLoopSimdDirectiveClass,
    OMPTeamsDistributeDirectiveClass,
    OMPTeamsDistributeParallelForDirectiveClass,
    OMPTeamsDistributeParallelForSimdDirectiveClass,
    OMPTeamsDistributeSimdDirectiveClass,
    OMPMasterDirectiveClass,
    OMPOrderedDirectiveClass,
    OMPParallelDirectiveClass,
    OMPParallelMasterDirectiveClass,
    OMPParallelSectionsDirectiveClass,
    OMPSectionDirectiveClass,
    OMPSectionsDirectiveClass,
    OMPSingleDirectiveClass,
    OMPTargetDataDirectiveClass,
    OMPTargetDirectiveClass,
    OMPTargetEnterDataDirectiveClass,
    OMPTargetExitDataDirectiveClass,
    OMPTargetParallelDirectiveClass,
    OMPTargetParallelForDirectiveClass,
    OMPTargetTeamsDirectiveClass,
    OMPTargetUpdateDirectiveClass,
    OMPTaskDirectiveClass,
    OMPTaskgroupDirectiveClass,
    OMPTaskwaitDirectiveClass,
    OMPTaskyieldDirectiveClass,
    OMPTeamsDirectiveClass,
    ObjCAtCatchStmtClass,
    ObjCAtFinallyStmtClass,
    ObjCAtSynchronizedStmtClass,
    ObjCAtThrowStmtClass,
    ObjCAtTryStmtClass,
    ObjCAutoreleasePoolStmtClass,
    ObjCForCollectionStmtClass,
    ReturnStmtClass,
    SEHExceptStmtClass,
    SEHFinallyStmtClass,
    SEHLeaveStmtClass,
    SEHTryStmtClass,
    CaseStmtClass,
    DefaultStmtClass,
    SwitchStmtClass,
    AttributedStmtClass,
    BinaryConditionalOperatorClass,
    ConditionalOperatorClass,
    AddrLabelExprClass,
    ArrayInitIndexExprClass,
    ArrayInitLoopExprClass,
    ArraySubscriptExprClass,
    ArrayTypeTraitExprClass,
    AsTypeExprClass,
    AtomicExprClass,
    BinaryOperatorClass,
    CompoundAssignOperatorClass,
    BlockExprClass,
    CXXBindTemporaryExprClass,
    CXXBoolLiteralExprClass,
    CXXConstructExprClass,
    CXXTemporaryObjectExprClass,
    CXXDefaultArgExprClass,
    CXXDefaultInitExprClass,
    CXXDeleteExprClass,
    CXXDependentScopeMemberExprClass,
    CXXFoldExprClass,
    CXXInheritedCtorInitExprClass,
    CXXNewExprClass,
    CXXNoexceptExprClass,
    CXXNullPtrLiteralExprClass,
    CXXPseudoDestructorExprClass,
    CXXRewrittenBinaryOperatorClass,
    CXXScalarValueInitExprClass,
    CXXStdInitializerListExprClass,
    CXXThisExprClass,
    CXXThrowExprClass,
    CXXTypeidExprClass,
    CXXUnresolvedConstructExprClass,
    CXXUuidofExprClass,
    CallExprClass,
    CUDAKernelCallExprClass,
    CXXMemberCallExprClass,
    CXXOperatorCallExprClass,
    UserDefinedLiteralClass,
    BuiltinBitCastExprClass,
    CStyleCastExprClass,
    CXXFunctionalCastExprClass,
    CXXConstCastExprClass,
    CXXDynamicCastExprClass,
    CXXReinterpretCastExprClass,
    CXXStaticCastExprClass,
    ObjCBridgedCastExprClass,
    ImplicitCastExprClass,
    CharacterLiteralClass,
    ChooseExprClass,
    CompoundLiteralExprClass,
    ConceptSpecializationExprClass,
    ConvertVectorExprClass,
    CoawaitExprClass,
    CoyieldExprClass,
    DeclRefExprClass,
    DependentCoawaitExprClass,
    DependentScopeDeclRefExprClass,
    DesignatedInitExprClass,
    DesignatedInitUpdateExprClass,
    ExpressionTraitExprClass,
    ExtVectorElementExprClass,
    FixedPointLiteralClass,
    FloatingLiteralClass,
    ConstantExprClass,
    ExprWithCleanupsClass,
    FunctionParmPackExprClass,
    GNUNullExprClass,
    GenericSelectionExprClass,
    ImaginaryLiteralClass,
    ImplicitValueInitExprClass,
    InitListExprClass,
    IntegerLiteralClass,
    LambdaExprClass,
    MSPropertyRefExprClass,
    MSPropertySubscriptExprClass,
    MaterializeTemporaryExprClass,
    MemberExprClass,
    NoInitExprClass,
    OMPArraySectionExprClass,
    ObjCArrayLiteralClass,
    ObjCAvailabilityCheckExprClass,
    ObjCBoolLiteralExprClass,
    ObjCBoxedExprClass,
    ObjCDictionaryLiteralClass,
    ObjCEncodeExprClass,
    ObjCIndirectCopyRestoreExprClass,
    ObjCIsaExprClass,
    ObjCIvarRefExprClass,
    ObjCMessageExprClass,
    ObjCPropertyRefExprClass,
    ObjCProtocolExprClass,
    ObjCSelectorExprClass,
    ObjCStringLiteralClass,
    ObjCSubscriptRefExprClass,
    OffsetOfExprClass,
    OpaqueValueExprClass,
    UnresolvedLookupExprClass,
    UnresolvedMemberExprClass,
    PackExpansionExprClass,
    ParenExprClass,
    ParenListExprClass,
    PredefinedExprClass,
    PseudoObjectExprClass,
    RequiresExprClass,
    ShuffleVectorExprClass,
    SizeOfPackExprClass,
    SourceLocExprClass,
    StmtExprClass,
    StringLiteralClass,
    SubstNonTypeTemplateParmExprClass,
    SubstNonTypeTemplateParmPackExprClass,
    TypeTraitExprClass,
    TypoExprClass,
    UnaryExprOrTypeTraitExprClass,
    UnaryOperatorClass,
    VAArgExprClass,
    LabelStmtClass,
    WhileStmtClass,
};

pub def ZigClangCK = extern enum {
    Dependent,
    BitCast,
    LValueBitCast,
    LValueToRValueBitCast,
    LValueToRValue,
    NoOp,
    BaseToDerived,
    DerivedToBase,
    UncheckedDerivedToBase,
    Dynamic,
    ToUnion,
    ArrayToPointerDecay,
    FunctionToPointerDecay,
    NullToPointer,
    NullToMemberPointer,
    BaseToDerivedMemberPointer,
    DerivedToBaseMemberPointer,
    MemberPointerToBoolean,
    ReinterpretMemberPointer,
    UserDefinedConversion,
    ConstructorConversion,
    IntegralToPointer,
    PointerToIntegral,
    PointerToBoolean,
    ToVoid,
    VectorSplat,
    IntegralCast,
    IntegralToBoolean,
    IntegralToFloating,
    FixedPointCast,
    FixedPointToIntegral,
    IntegralToFixedPoint,
    FixedPointToBoolean,
    FloatingToIntegral,
    FloatingToBoolean,
    BooleanToSignedIntegral,
    FloatingCast,
    CPointerToObjCPointerCast,
    BlockPointerToObjCPointerCast,
    AnyPointerToBlockPointerCast,
    ObjCObjectLValueCast,
    FloatingRealToComplex,
    FloatingComplexToReal,
    FloatingComplexToBoolean,
    FloatingComplexCast,
    FloatingComplexToIntegralComplex,
    IntegralRealToComplex,
    IntegralComplexToReal,
    IntegralComplexToBoolean,
    IntegralComplexCast,
    IntegralComplexToFloatingComplex,
    ARCProduceObject,
    ARCConsumeObject,
    ARCReclaimReturnedObject,
    ARCExtendBlockObject,
    AtomicToNonAtomic,
    NonAtomicToAtomic,
    CopyAndAutoreleaseBlockObject,
    BuiltinFnToFnPtr,
    ZeroToOCLOpaqueType,
    AddressSpaceConversion,
    IntToOCLSampler,
};

pub def ZigClangAPValueKind = extern enum {
    None,
    Indeterminate,
    Int,
    Float,
    FixedPoint,
    ComplexInt,
    ComplexFloat,
    LValue,
    Vector,
    Array,
    Struct,
    Union,
    MemberPointer,
    AddrLabelDiff,
};

pub def ZigClangDeclKind = extern enum {
    AccessSpec,
    Block,
    Captured,
    ClassScopeFunctionSpecialization,
    Empty,
    Export,
    ExternCContext,
    FileScopeAsm,
    Friend,
    FriendTemplate,
    Import,
    LifetimeExtendedTemporary,
    LinkageSpec,
    Label,
    Namespace,
    NamespaceAlias,
    ObjCCompatibleAlias,
    ObjCCategory,
    ObjCCategoryImpl,
    ObjCImplementation,
    ObjCInterface,
    ObjCProtocol,
    ObjCMethod,
    ObjCProperty,
    BuiltinTemplate,
    Concept,
    ClassTemplate,
    FunctionTemplate,
    TypeAliasTemplate,
    VarTemplate,
    TemplateTemplateParm,
    Enum,
    Record,
    CXXRecord,
    ClassTemplateSpecialization,
    ClassTemplatePartialSpecialization,
    TemplateTypeParm,
    ObjCTypeParam,
    TypeAlias,
    Typedef,
    UnresolvedUsingTypename,
    Using,
    UsingDirective,
    UsingPack,
    UsingShadow,
    ConstructorUsingShadow,
    Binding,
    Field,
    ObjCAtDefsField,
    ObjCIvar,
    Function,
    CXXDeductionGuide,
    CXXMethod,
    CXXConstructor,
    CXXConversion,
    CXXDestructor,
    MSProperty,
    NonTypeTemplateParm,
    Var,
    Decomposition,
    ImplicitParam,
    OMPCapturedExpr,
    ParmVar,
    VarTemplateSpecialization,
    VarTemplatePartialSpecialization,
    EnumConstant,
    IndirectField,
    OMPDeclareMapper,
    OMPDeclareReduction,
    UnresolvedUsingValue,
    OMPAllocate,
    OMPRequires,
    OMPThreadPrivate,
    ObjCPropertyImpl,
    PragmaComment,
    PragmaDetectMismatch,
    RequiresExprBody,
    StaticAssert,
    TranslationUnit,
};

pub def ZigClangBuiltinTypeKind = extern enum {
    OCLImage1dRO,
    OCLImage1dArrayRO,
    OCLImage1dBufferRO,
    OCLImage2dRO,
    OCLImage2dArrayRO,
    OCLImage2dDepthRO,
    OCLImage2dArrayDepthRO,
    OCLImage2dMSAARO,
    OCLImage2dArrayMSAARO,
    OCLImage2dMSAADepthRO,
    OCLImage2dArrayMSAADepthRO,
    OCLImage3dRO,
    OCLImage1dWO,
    OCLImage1dArrayWO,
    OCLImage1dBufferWO,
    OCLImage2dWO,
    OCLImage2dArrayWO,
    OCLImage2dDepthWO,
    OCLImage2dArrayDepthWO,
    OCLImage2dMSAAWO,
    OCLImage2dArrayMSAAWO,
    OCLImage2dMSAADepthWO,
    OCLImage2dArrayMSAADepthWO,
    OCLImage3dWO,
    OCLImage1dRW,
    OCLImage1dArrayRW,
    OCLImage1dBufferRW,
    OCLImage2dRW,
    OCLImage2dArrayRW,
    OCLImage2dDepthRW,
    OCLImage2dArrayDepthRW,
    OCLImage2dMSAARW,
    OCLImage2dArrayMSAARW,
    OCLImage2dMSAADepthRW,
    OCLImage2dArrayMSAADepthRW,
    OCLImage3dRW,
    OCLIntelSubgroupAVCMcePayload,
    OCLIntelSubgroupAVCImePayload,
    OCLIntelSubgroupAVCRefPayload,
    OCLIntelSubgroupAVCSicPayload,
    OCLIntelSubgroupAVCMceResult,
    OCLIntelSubgroupAVCImeResult,
    OCLIntelSubgroupAVCRefResult,
    OCLIntelSubgroupAVCSicResult,
    OCLIntelSubgroupAVCImeResultSingleRefStreamout,
    OCLIntelSubgroupAVCImeResultDualRefStreamout,
    OCLIntelSubgroupAVCImeSingleRefStreamin,
    OCLIntelSubgroupAVCImeDualRefStreamin,
    SveInt8,
    SveInt16,
    SveInt32,
    SveInt64,
    SveUint8,
    SveUint16,
    SveUint32,
    SveUint64,
    SveFloat16,
    SveFloat32,
    SveFloat64,
    SveBool,
    Void,
    Bool,
    Char_U,
    UChar,
    WChar_U,
    Char8,
    Char16,
    Char32,
    UShort,
    UInt,
    ULong,
    ULongLong,
    UInt128,
    Char_S,
    SChar,
    WChar_S,
    Short,
    Int,
    Long,
    LongLong,
    Int128,
    ShortAccum,
    Accum,
    LongAccum,
    UShortAccum,
    UAccum,
    ULongAccum,
    ShortFract,
    Fract,
    LongFract,
    UShortFract,
    UFract,
    ULongFract,
    SatShortAccum,
    SatAccum,
    SatLongAccum,
    SatUShortAccum,
    SatUAccum,
    SatULongAccum,
    SatShortFract,
    SatFract,
    SatLongFract,
    SatUShortFract,
    SatUFract,
    SatULongFract,
    Half,
    Float,
    Double,
    LongDouble,
    Float16,
    Float128,
    NullPtr,
    ObjCId,
    ObjCClass,
    ObjCSel,
    OCLSampler,
    OCLEvent,
    OCLClkEvent,
    OCLQueue,
    OCLReserveID,
    Dependent,
    Overload,
    BoundMember,
    PseudoObject,
    UnknownAny,
    BuiltinFn,
    ARCUnbridgedCast,
    OMPArraySection,
};

pub def ZigClangCallingConv = extern enum {
    C,
    X86StdCall,
    X86FastCall,
    X86ThisCall,
    X86VectorCall,
    X86Pascal,
    Win64,
    X86_64SysV,
    X86RegCall,
    AAPCS,
    AAPCS_VFP,
    IntelOclBicc,
    SpirFunction,
    OpenCLKernel,
    Swift,
    PreserveMost,
    PreserveAll,
    AArch64VectorCall,
};

pub def ZigClangStorageClass = extern enum {
    None,
    Extern,
    Static,
    PrivateExtern,
    Auto,
    Register,
};

pub def ZigClangAPFloat_roundingMode = extern enum {
    NearestTiesToEven,
    TowardPositive,
    TowardNegative,
    TowardZero,
    NearestTiesToAway,
};

pub def ZigClangStringLiteral_StringKind = extern enum {
    Ascii,
    Wide,
    UTF8,
    UTF16,
    UTF32,
};

pub def ZigClangCharacterLiteral_CharacterKind = extern enum {
    Ascii,
    Wide,
    UTF8,
    UTF16,
    UTF32,
};

pub def ZigClangRecordDecl_field_iterator = extern struct {
    opaque: *c_void,
};

pub def ZigClangEnumDecl_enumerator_iterator = extern struct {
    opaque: *c_void,
};

pub def ZigClangPreprocessingRecord_iterator = extern struct {
    I: c_int,
    Self: *ZigClangPreprocessingRecord,
};

pub def ZigClangPreprocessedEntity_EntityKind = extern enum {
    InvalidKind,
    MacroExpansionKind,
    MacroDefinitionKind,
    InclusionDirectiveKind,
};

pub def ZigClangExpr_ConstExprUsage = extern enum {
    EvaluateForCodeGen,
    EvaluateForMangling,
};

pub extern fn ZigClangSourceManager_getSpellingLoc(self: ?*struct_ZigClangSourceManager, Loc: struct_ZigClangSourceLocation) struct_ZigClangSourceLocation;
pub extern fn ZigClangSourceManager_getFilename(self: *struct_ZigClangSourceManager, SpellingLoc: struct_ZigClangSourceLocation) ?[*:0]u8;
pub extern fn ZigClangSourceManager_getSpellingLineNumber(self: ?*struct_ZigClangSourceManager, Loc: struct_ZigClangSourceLocation) c_uint;
pub extern fn ZigClangSourceManager_getSpellingColumnNumber(self: ?*struct_ZigClangSourceManager, Loc: struct_ZigClangSourceLocation) c_uint;
pub extern fn ZigClangSourceManager_getCharacterData(self: ?*struct_ZigClangSourceManager, SL: struct_ZigClangSourceLocation) [*:0]u8;
pub extern fn ZigClangASTContext_getPointerType(self: ?*struct_ZigClangASTContext, T: struct_ZigClangQualType) struct_ZigClangQualType;
pub extern fn ZigClangASTUnit_getASTContext(self: ?*struct_ZigClangASTUnit) ?*struct_ZigClangASTContext;
pub extern fn ZigClangASTUnit_getSourceManager(self: *struct_ZigClangASTUnit) *struct_ZigClangSourceManager;
pub extern fn ZigClangASTUnit_visitLocalTopLevelDecls(self: *struct_ZigClangASTUnit, context: ?*c_void, Fn: ?extern fn (?*c_void, *struct_ZigClangDecl) bool) bool;
pub extern fn ZigClangRecordType_getDecl(record_ty: ?*struct_ZigClangRecordType) *struct_ZigClangRecordDecl;
pub extern fn ZigClangTagDecl_isThisDeclarationADefinition(self: *ZigClangTagDecl) bool;
pub extern fn ZigClangEnumType_getDecl(record_ty: ?*struct_ZigClangEnumType) *struct_ZigClangEnumDecl;
pub extern fn ZigClangRecordDecl_getCanonicalDecl(record_decl: ?*struct_ZigClangRecordDecl) ?*struct_ZigClangTagDecl;
pub extern fn ZigClangFieldDecl_getCanonicalDecl(field_decl: ?*struct_ZigClangFieldDecl) ?*struct_ZigClangFieldDecl;
pub extern fn ZigClangFieldDecl_getAlignedAttribute(field_decl: ?*struct_ZigClangFieldDecl, *ZigClangASTContext) c_uint;
pub extern fn ZigClangEnumDecl_getCanonicalDecl(self: ?*struct_ZigClangEnumDecl) ?*struct_ZigClangTagDecl;
pub extern fn ZigClangTypedefNameDecl_getCanonicalDecl(self: ?*struct_ZigClangTypedefNameDecl) ?*struct_ZigClangTypedefNameDecl;
pub extern fn ZigClangFunctionDecl_getCanonicalDecl(self: ?*struct_ZigClangFunctionDecl) ?*struct_ZigClangFunctionDecl;
pub extern fn ZigClangParmVarDecl_getOriginalType(self: ?*struct_ZigClangParmVarDecl) struct_ZigClangQualType;
pub extern fn ZigClangVarDecl_getCanonicalDecl(self: ?*struct_ZigClangVarDecl) ?*struct_ZigClangVarDecl;
pub extern fn ZigClangVarDecl_getSectionAttribute(self: *ZigClangVarDecl, len: *usize) ?[*]u8;
pub extern fn ZigClangFunctionDecl_getAlignedAttribute(self: *ZigClangFunctionDecl, *ZigClangASTContext) c_uint;
pub extern fn ZigClangVarDecl_getAlignedAttribute(self: *ZigClangVarDecl, *ZigClangASTContext) c_uint;
pub extern fn ZigClangRecordDecl_getPackedAttribute(self: ?*struct_ZigClangRecordDecl) bool;
pub extern fn ZigClangRecordDecl_getDefinition(self: ?*struct_ZigClangRecordDecl) ?*struct_ZigClangRecordDecl;
pub extern fn ZigClangEnumDecl_getDefinition(self: ?*struct_ZigClangEnumDecl) ?*struct_ZigClangEnumDecl;
pub extern fn ZigClangRecordDecl_getLocation(self: ?*struct_ZigClangRecordDecl) struct_ZigClangSourceLocation;
pub extern fn ZigClangEnumDecl_getLocation(self: ?*struct_ZigClangEnumDecl) struct_ZigClangSourceLocation;
pub extern fn ZigClangTypedefNameDecl_getLocation(self: ?*struct_ZigClangTypedefNameDecl) struct_ZigClangSourceLocation;
pub extern fn ZigClangDecl_getLocation(self: *ZigClangDecl) ZigClangSourceLocation;
pub extern fn ZigClangRecordDecl_isUnion(record_decl: ?*struct_ZigClangRecordDecl) bool;
pub extern fn ZigClangRecordDecl_isStruct(record_decl: ?*struct_ZigClangRecordDecl) bool;
pub extern fn ZigClangRecordDecl_isAnonymousStructOrUnion(record_decl: ?*struct_ZigClangRecordDecl) bool;
pub extern fn ZigClangRecordDecl_field_begin(*struct_ZigClangRecordDecl) ZigClangRecordDecl_field_iterator;
pub extern fn ZigClangRecordDecl_field_end(*struct_ZigClangRecordDecl) ZigClangRecordDecl_field_iterator;
pub extern fn ZigClangRecordDecl_field_iterator_next(ZigClangRecordDecl_field_iterator) ZigClangRecordDecl_field_iterator;
pub extern fn ZigClangRecordDecl_field_iterator_deref(ZigClangRecordDecl_field_iterator) *struct_ZigClangFieldDecl;
pub extern fn ZigClangRecordDecl_field_iterator_neq(ZigClangRecordDecl_field_iterator, ZigClangRecordDecl_field_iterator) bool;
pub extern fn ZigClangEnumDecl_getIntegerType(self: ?*struct_ZigClangEnumDecl) struct_ZigClangQualType;
pub extern fn ZigClangEnumDecl_enumerator_begin(*ZigClangEnumDecl) ZigClangEnumDecl_enumerator_iterator;
pub extern fn ZigClangEnumDecl_enumerator_end(*ZigClangEnumDecl) ZigClangEnumDecl_enumerator_iterator;
pub extern fn ZigClangEnumDecl_enumerator_iterator_next(ZigClangEnumDecl_enumerator_iterator) ZigClangEnumDecl_enumerator_iterator;
pub extern fn ZigClangEnumDecl_enumerator_iterator_deref(ZigClangEnumDecl_enumerator_iterator) *ZigClangEnumConstantDecl;
pub extern fn ZigClangEnumDecl_enumerator_iterator_neq(ZigClangEnumDecl_enumerator_iterator, ZigClangEnumDecl_enumerator_iterator) bool;
pub extern fn ZigClangDecl_castToNamedDecl(decl: *struct_ZigClangDecl) ?*ZigClangNamedDecl;
pub extern fn ZigClangNamedDecl_getName_bytes_begin(decl: ?*struct_ZigClangNamedDecl) [*:0]u8;
pub extern fn ZigClangSourceLocation_eq(a: struct_ZigClangSourceLocation, b: struct_ZigClangSourceLocation) bool;
pub extern fn ZigClangTypedefType_getDecl(self: ?*struct_ZigClangTypedefType) *struct_ZigClangTypedefNameDecl;
pub extern fn ZigClangTypedefNameDecl_getUnderlyingType(self: ?*struct_ZigClangTypedefNameDecl) struct_ZigClangQualType;
pub extern fn ZigClangQualType_getCanonicalType(self: struct_ZigClangQualType) struct_ZigClangQualType;
pub extern fn ZigClangQualType_getTypeClass(self: struct_ZigClangQualType) ZigClangTypeClass;
pub extern fn ZigClangQualType_getTypePtr(self: struct_ZigClangQualType) *struct_ZigClangType;
pub extern fn ZigClangQualType_addConst(self: *struct_ZigClangQualType) void;
pub extern fn ZigClangQualType_eq(self: struct_ZigClangQualType, arg1: struct_ZigClangQualType) bool;
pub extern fn ZigClangQualType_isConstQualified(self: struct_ZigClangQualType) bool;
pub extern fn ZigClangQualType_isVolatileQualified(self: struct_ZigClangQualType) bool;
pub extern fn ZigClangQualType_isRestrictQualified(self: struct_ZigClangQualType) bool;
pub extern fn ZigClangType_getTypeClass(self: ?*struct_ZigClangType) ZigClangTypeClass;
pub extern fn ZigClangType_getPointeeType(self: ?*struct_ZigClangType) struct_ZigClangQualType;
pub extern fn ZigClangType_isVoidType(self: ?*struct_ZigClangType) bool;
pub extern fn ZigClangType_isConstantArrayType(self: ?*struct_ZigClangType) bool;
pub extern fn ZigClangType_isRecordType(self: ?*struct_ZigClangType) bool;
pub extern fn ZigClangType_isIncompleteOrZeroLengthArrayType(self: ?*struct_ZigClangType, *ZigClangASTContext) bool;
pub extern fn ZigClangType_isArrayType(self: ?*struct_ZigClangType) bool;
pub extern fn ZigClangType_isBooleanType(self: ?*struct_ZigClangType) bool;
pub extern fn ZigClangType_getTypeClassName(self: *struct_ZigClangType) [*:0]u8;
pub extern fn ZigClangType_getAsArrayTypeUnsafe(self: *ZigClangType) *ZigClangArrayType;
pub extern fn ZigClangType_getAsRecordType(self: *ZigClangType) ?*ZigClangRecordType;
pub extern fn ZigClangType_getAsUnionType(self: *ZigClangType) ?*ZigClangRecordType;
pub extern fn ZigClangStmt_getBeginLoc(self: *struct_ZigClangStmt) struct_ZigClangSourceLocation;
pub extern fn ZigClangStmt_getStmtClass(self: ?*struct_ZigClangStmt) ZigClangStmtClass;
pub extern fn ZigClangStmt_classof_Expr(self: ?*struct_ZigClangStmt) bool;
pub extern fn ZigClangExpr_getStmtClass(self: *struct_ZigClangExpr) ZigClangStmtClass;
pub extern fn ZigClangExpr_getType(self: *struct_ZigClangExpr) struct_ZigClangQualType;
pub extern fn ZigClangExpr_getBeginLoc(self: *struct_ZigClangExpr) struct_ZigClangSourceLocation;
pub extern fn ZigClangInitListExpr_getInit(self: ?*struct_ZigClangInitListExpr, i: c_uint) *ZigClangExpr;
pub extern fn ZigClangInitListExpr_getArrayFiller(self: ?*struct_ZigClangInitListExpr) *ZigClangExpr;
pub extern fn ZigClangInitListExpr_getNumInits(self: ?*struct_ZigClangInitListExpr) c_uint;
pub extern fn ZigClangInitListExpr_getInitializedFieldInUnion(self: ?*struct_ZigClangInitListExpr) ?*ZigClangFieldDecl;
pub extern fn ZigClangAPValue_getKind(self: ?*struct_ZigClangAPValue) ZigClangAPValueKind;
pub extern fn ZigClangAPValue_getInt(self: ?*struct_ZigClangAPValue) *struct_ZigClangAPSInt;
pub extern fn ZigClangAPValue_getArrayInitializedElts(self: ?*struct_ZigClangAPValue) c_uint;
pub extern fn ZigClangAPValue_getArraySize(self: ?*struct_ZigClangAPValue) c_uint;
pub extern fn ZigClangAPValue_getLValueBase(self: ?*struct_ZigClangAPValue) struct_ZigClangAPValueLValueBase;
pub extern fn ZigClangAPSInt_isSigned(self: *struct_ZigClangAPSInt) bool;
pub extern fn ZigClangAPSInt_isNegative(self: *struct_ZigClangAPSInt) bool;
pub extern fn ZigClangAPSInt_negate(self: *struct_ZigClangAPSInt) *struct_ZigClangAPSInt;
pub extern fn ZigClangAPSInt_free(self: *struct_ZigClangAPSInt) void;
pub extern fn ZigClangAPSInt_getRawData(self: *struct_ZigClangAPSInt) [*:0]u64;
pub extern fn ZigClangAPSInt_getNumWords(self: *struct_ZigClangAPSInt) c_uint;

pub extern fn ZigClangAPInt_getLimitedValue(self: *struct_ZigClangAPInt, limit: u64) u64;
pub extern fn ZigClangAPValueLValueBase_dyn_cast_Expr(self: struct_ZigClangAPValueLValueBase) ?*struct_ZigClangExpr;
pub extern fn ZigClangASTUnit_delete(self: ?*struct_ZigClangASTUnit) void;

pub extern fn ZigClangFunctionDecl_getType(self: *ZigClangFunctionDecl) struct_ZigClangQualType;
pub extern fn ZigClangFunctionDecl_getLocation(self: *ZigClangFunctionDecl) struct_ZigClangSourceLocation;
pub extern fn ZigClangFunctionDecl_hasBody(self: *ZigClangFunctionDecl) bool;
pub extern fn ZigClangFunctionDecl_getStorageClass(self: *ZigClangFunctionDecl) ZigClangStorageClass;
pub extern fn ZigClangFunctionDecl_getParamDecl(self: *ZigClangFunctionDecl, i: c_uint) *struct_ZigClangParmVarDecl;
pub extern fn ZigClangFunctionDecl_getBody(self: *ZigClangFunctionDecl) *struct_ZigClangStmt;
pub extern fn ZigClangFunctionDecl_doesDeclarationForceExternallyVisibleDefinition(self: *ZigClangFunctionDecl) bool;
pub extern fn ZigClangFunctionDecl_isThisDeclarationADefinition(self: *ZigClangFunctionDecl) bool;
pub extern fn ZigClangFunctionDecl_doesThisDeclarationHaveABody(self: *ZigClangFunctionDecl) bool;
pub extern fn ZigClangFunctionDecl_isInlineSpecified(self: *ZigClangFunctionDecl) bool;
pub extern fn ZigClangFunctionDecl_isDefined(self: *ZigClangFunctionDecl) bool;
pub extern fn ZigClangFunctionDecl_getDefinition(self: *ZigClangFunctionDecl) ?*struct_ZigClangFunctionDecl;
pub extern fn ZigClangFunctionDecl_getSectionAttribute(self: *ZigClangFunctionDecl, len: *usize) ?[*]u8;

pub extern fn ZigClangBuiltinType_getKind(self: *struct_ZigClangBuiltinType) ZigClangBuiltinTypeKind;

pub extern fn ZigClangFunctionType_getNoReturnAttr(self: *ZigClangFunctionType) bool;
pub extern fn ZigClangFunctionType_getCallConv(self: *ZigClangFunctionType) ZigClangCallingConv;
pub extern fn ZigClangFunctionType_getReturnType(self: *ZigClangFunctionType) ZigClangQualType;

pub extern fn ZigClangFunctionProtoType_isVariadic(self: *struct_ZigClangFunctionProtoType) bool;
pub extern fn ZigClangFunctionProtoType_getNumParams(self: *struct_ZigClangFunctionProtoType) c_uint;
pub extern fn ZigClangFunctionProtoType_getParamType(self: *struct_ZigClangFunctionProtoType, i: c_uint) ZigClangQualType;
pub extern fn ZigClangFunctionProtoType_getReturnType(self: *ZigClangFunctionProtoType) ZigClangQualType;

pub def ZigClangSourceLocation = struct_ZigClangSourceLocation;
pub def ZigClangQualType = struct_ZigClangQualType;
pub def ZigClangConditionalOperator = struct_ZigClangConditionalOperator;
pub def ZigClangBinaryConditionalOperator = struct_ZigClangBinaryConditionalOperator;
pub def ZigClangAbstractConditionalOperator = struct_ZigClangAbstractConditionalOperator;
pub def ZigClangAPValueLValueBase = struct_ZigClangAPValueLValueBase;
pub def ZigClangAPValue = struct_ZigClangAPValue;
pub def ZigClangAPSInt = struct_ZigClangAPSInt;
pub def ZigClangAPFloat = struct_ZigClangAPFloat;
pub def ZigClangASTContext = struct_ZigClangASTContext;
pub def ZigClangASTUnit = struct_ZigClangASTUnit;
pub def ZigClangArraySubscriptExpr = struct_ZigClangArraySubscriptExpr;
pub def ZigClangArrayType = struct_ZigClangArrayType;
pub def ZigClangAttributedType = struct_ZigClangAttributedType;
pub def ZigClangBinaryOperator = struct_ZigClangBinaryOperator;
pub def ZigClangBreakStmt = struct_ZigClangBreakStmt;
pub def ZigClangBuiltinType = struct_ZigClangBuiltinType;
pub def ZigClangCStyleCastExpr = struct_ZigClangCStyleCastExpr;
pub def ZigClangCallExpr = struct_ZigClangCallExpr;
pub def ZigClangCaseStmt = struct_ZigClangCaseStmt;
pub def ZigClangCompoundAssignOperator = struct_ZigClangCompoundAssignOperator;
pub def ZigClangCompoundStmt = struct_ZigClangCompoundStmt;
pub def ZigClangConstantArrayType = struct_ZigClangConstantArrayType;
pub def ZigClangContinueStmt = struct_ZigClangContinueStmt;
pub def ZigClangDecayedType = struct_ZigClangDecayedType;
pub def ZigClangDecl = struct_ZigClangDecl;
pub def ZigClangDeclRefExpr = struct_ZigClangDeclRefExpr;
pub def ZigClangDeclStmt = struct_ZigClangDeclStmt;
pub def ZigClangDefaultStmt = struct_ZigClangDefaultStmt;
pub def ZigClangDiagnosticOptions = struct_ZigClangDiagnosticOptions;
pub def ZigClangDiagnosticsEngine = struct_ZigClangDiagnosticsEngine;
pub def ZigClangDoStmt = struct_ZigClangDoStmt;
pub def ZigClangElaboratedType = struct_ZigClangElaboratedType;
pub def ZigClangEnumConstantDecl = struct_ZigClangEnumConstantDecl;
pub def ZigClangEnumDecl = struct_ZigClangEnumDecl;
pub def ZigClangEnumType = struct_ZigClangEnumType;
pub def ZigClangExpr = struct_ZigClangExpr;
pub def ZigClangFieldDecl = struct_ZigClangFieldDecl;
pub def ZigClangFileID = struct_ZigClangFileID;
pub def ZigClangForStmt = struct_ZigClangForStmt;
pub def ZigClangFullSourceLoc = struct_ZigClangFullSourceLoc;
pub def ZigClangFunctionDecl = struct_ZigClangFunctionDecl;
pub def ZigClangFunctionProtoType = struct_ZigClangFunctionProtoType;
pub def ZigClangIfStmt = struct_ZigClangIfStmt;
pub def ZigClangImplicitCastExpr = struct_ZigClangImplicitCastExpr;
pub def ZigClangIncompleteArrayType = struct_ZigClangIncompleteArrayType;
pub def ZigClangIntegerLiteral = struct_ZigClangIntegerLiteral;
pub def ZigClangMacroDefinitionRecord = struct_ZigClangMacroDefinitionRecord;
pub def ZigClangMacroExpansion = struct_ZigClangMacroExpansion;
pub def ZigClangMacroQualifiedType = struct_ZigClangMacroQualifiedType;
pub def ZigClangMemberExpr = struct_ZigClangMemberExpr;
pub def ZigClangNamedDecl = struct_ZigClangNamedDecl;
pub def ZigClangNone = struct_ZigClangNone;
pub def ZigClangOpaqueValueExpr = struct_ZigClangOpaqueValueExpr;
pub def ZigClangPCHContainerOperations = struct_ZigClangPCHContainerOperations;
pub def ZigClangParenExpr = struct_ZigClangParenExpr;
pub def ZigClangParenType = struct_ZigClangParenType;
pub def ZigClangParmVarDecl = struct_ZigClangParmVarDecl;
pub def ZigClangPointerType = struct_ZigClangPointerType;
pub def ZigClangPreprocessedEntity = struct_ZigClangPreprocessedEntity;
pub def ZigClangRecordDecl = struct_ZigClangRecordDecl;
pub def ZigClangRecordType = struct_ZigClangRecordType;
pub def ZigClangReturnStmt = struct_ZigClangReturnStmt;
pub def ZigClangSkipFunctionBodiesScope = struct_ZigClangSkipFunctionBodiesScope;
pub def ZigClangSourceManager = struct_ZigClangSourceManager;
pub def ZigClangSourceRange = struct_ZigClangSourceRange;
pub def ZigClangStmt = struct_ZigClangStmt;
pub def ZigClangStringLiteral = struct_ZigClangStringLiteral;
pub def ZigClangStringRef = struct_ZigClangStringRef;
pub def ZigClangSwitchStmt = struct_ZigClangSwitchStmt;
pub def ZigClangTagDecl = struct_ZigClangTagDecl;
pub def ZigClangType = struct_ZigClangType;
pub def ZigClangTypedefNameDecl = struct_ZigClangTypedefNameDecl;
pub def ZigClangTypedefType = struct_ZigClangTypedefType;
pub def ZigClangUnaryExprOrTypeTraitExpr = struct_ZigClangUnaryExprOrTypeTraitExpr;
pub def ZigClangUnaryOperator = struct_ZigClangUnaryOperator;
pub def ZigClangValueDecl = struct_ZigClangValueDecl;
pub def ZigClangVarDecl = struct_ZigClangVarDecl;
pub def ZigClangWhileStmt = struct_ZigClangWhileStmt;
pub def ZigClangFunctionType = struct_ZigClangFunctionType;
pub def ZigClangPredefinedExpr = struct_ZigClangPredefinedExpr;
pub def ZigClangInitListExpr = struct_ZigClangInitListExpr;

pub def struct_ZigClangSourceLocation = extern struct {
    ID: c_uint,
};

pub def Stage2ErrorMsg = extern struct {
    filename_ptr: ?[*]u8,
    filename_len: usize,
    msg_ptr: [*]u8,
    msg_len: usize,
    // valid until the ASTUnit is freed
    source: ?[*]u8,
    // 0 based
    line: c_uint,
    // 0 based
    column: c_uint,
    // byte offset into source
    offset: c_uint,
};

pub def struct_ZigClangQualType = extern struct {
    ptr: ?*c_void,
};

pub def struct_ZigClangAPValueLValueBase = extern struct {
    Ptr: ?*c_void,
    CallIndex: c_uint,
    Version: c_uint,
};

pub extern fn ZigClangErrorMsg_delete(ptr: [*]Stage2ErrorMsg, len: usize) void;

pub extern fn ZigClangLoadFromCommandLine(
    args_begin: [*]?[*]u8,
    args_end: [*]?[*]u8,
    errors_ptr: *[*]Stage2ErrorMsg,
    errors_len: *usize,
    resources_path: [*:0]u8,
) ?*ZigClangASTUnit;

pub extern fn ZigClangDecl_getKind(decl: *ZigClangDecl) ZigClangDeclKind;
pub extern fn ZigClangDecl_getDeclKindName(decl: *struct_ZigClangDecl) [*:0]u8;

pub def ZigClangCompoundStmt_const_body_iterator = [*]*struct_ZigClangStmt;

pub extern fn ZigClangCompoundStmt_body_begin(self: *ZigClangCompoundStmt) ZigClangCompoundStmt_const_body_iterator;
pub extern fn ZigClangCompoundStmt_body_end(self: *ZigClangCompoundStmt) ZigClangCompoundStmt_const_body_iterator;

pub def ZigClangDeclStmt_const_decl_iterator = [*]*struct_ZigClangDecl;

pub extern fn ZigClangDeclStmt_decl_begin(self: *ZigClangDeclStmt) ZigClangDeclStmt_const_decl_iterator;
pub extern fn ZigClangDeclStmt_decl_end(self: *ZigClangDeclStmt) ZigClangDeclStmt_const_decl_iterator;

pub extern fn ZigClangVarDecl_getLocation(self: *struct_ZigClangVarDecl) ZigClangSourceLocation;
pub extern fn ZigClangVarDecl_hasInit(self: *struct_ZigClangVarDecl) bool;
pub extern fn ZigClangVarDecl_getStorageClass(self: *ZigClangVarDecl) ZigClangStorageClass;
pub extern fn ZigClangVarDecl_getType(self: ?*struct_ZigClangVarDecl) struct_ZigClangQualType;
pub extern fn ZigClangVarDecl_getInit(*ZigClangVarDecl) ?*ZigClangExpr;
pub extern fn ZigClangVarDecl_getTLSKind(self: ?*struct_ZigClangVarDecl) ZigClangVarDecl_TLSKind;
pub def ZigClangVarDecl_TLSKind = extern enum {
    None,
    Static,
    Dynamic,
};

pub extern fn ZigClangImplicitCastExpr_getBeginLoc(*ZigClangImplicitCastExpr) ZigClangSourceLocation;
pub extern fn ZigClangImplicitCastExpr_getCastKind(*ZigClangImplicitCastExpr) ZigClangCK;
pub extern fn ZigClangImplicitCastExpr_getSubExpr(*ZigClangImplicitCastExpr) *ZigClangExpr;

pub extern fn ZigClangArrayType_getElementType(*ZigClangArrayType) ZigClangQualType;
pub extern fn ZigClangIncompleteArrayType_getElementType(*ZigClangIncompleteArrayType) ZigClangQualType;

pub extern fn ZigClangConstantArrayType_getElementType(self: *struct_ZigClangConstantArrayType) ZigClangQualType;
pub extern fn ZigClangConstantArrayType_getSize(self: *struct_ZigClangConstantArrayType) *struct_ZigClangAPInt;
pub extern fn ZigClangDeclRefExpr_getDecl(*ZigClangDeclRefExpr) *ZigClangValueDecl;
pub extern fn ZigClangDeclRefExpr_getFoundDecl(*ZigClangDeclRefExpr) *ZigClangNamedDecl;

pub extern fn ZigClangParenType_getInnerType(*ZigClangParenType) ZigClangQualType;

pub extern fn ZigClangElaboratedType_getNamedType(*ZigClangElaboratedType) ZigClangQualType;

pub extern fn ZigClangAttributedType_getEquivalentType(*ZigClangAttributedType) ZigClangQualType;

pub extern fn ZigClangMacroQualifiedType_getModifiedType(*ZigClangMacroQualifiedType) ZigClangQualType;

pub extern fn ZigClangCStyleCastExpr_getBeginLoc(*ZigClangCStyleCastExpr) ZigClangSourceLocation;
pub extern fn ZigClangCStyleCastExpr_getSubExpr(*ZigClangCStyleCastExpr) *ZigClangExpr;
pub extern fn ZigClangCStyleCastExpr_getType(*ZigClangCStyleCastExpr) ZigClangQualType;

pub def ZigClangExprEvalResult = struct_ZigClangExprEvalResult;
pub def struct_ZigClangExprEvalResult = extern struct {
    HasSideEffects: bool,
    HasUndefinedBehavior: bool,
    SmallVectorImpl: ?*c_void,
    Val: ZigClangAPValue,
};

pub def struct_ZigClangAPValue = extern struct {
    Kind: ZigClangAPValueKind,
    Data: if (builtin.os.tag == .windows and builtin.abi == .msvc) [52]u8 else [68]u8,
};
pub extern fn ZigClangVarDecl_getTypeSourceInfo_getType(self: *struct_ZigClangVarDecl) struct_ZigClangQualType;

pub extern fn ZigClangIntegerLiteral_EvaluateAsInt(*ZigClangIntegerLiteral, *ZigClangExprEvalResult, *ZigClangASTContext) bool;
pub extern fn ZigClangIntegerLiteral_getBeginLoc(*ZigClangIntegerLiteral) ZigClangSourceLocation;

pub extern fn ZigClangReturnStmt_getRetValue(*ZigClangReturnStmt) ?*ZigClangExpr;

pub extern fn ZigClangBinaryOperator_getOpcode(*ZigClangBinaryOperator) ZigClangBO;
pub extern fn ZigClangBinaryOperator_getBeginLoc(*ZigClangBinaryOperator) ZigClangSourceLocation;
pub extern fn ZigClangBinaryOperator_getLHS(*ZigClangBinaryOperator) *ZigClangExpr;
pub extern fn ZigClangBinaryOperator_getRHS(*ZigClangBinaryOperator) *ZigClangExpr;
pub extern fn ZigClangBinaryOperator_getType(*ZigClangBinaryOperator) ZigClangQualType;

pub extern fn ZigClangDecayedType_getDecayedType(*ZigClangDecayedType) ZigClangQualType;

pub extern fn ZigClangStringLiteral_getKind(*ZigClangStringLiteral) ZigClangStringLiteral_StringKind;
pub extern fn ZigClangStringLiteral_getString_bytes_begin_size(*ZigClangStringLiteral, *usize) [*]u8;

pub extern fn ZigClangParenExpr_getSubExpr(*ZigClangParenExpr) *ZigClangExpr;

pub extern fn ZigClangFieldDecl_isAnonymousStructOrUnion(*struct_ZigClangFieldDecl) bool;
pub extern fn ZigClangFieldDecl_isBitField(*struct_ZigClangFieldDecl) bool;
pub extern fn ZigClangFieldDecl_getType(*struct_ZigClangFieldDecl) struct_ZigClangQualType;
pub extern fn ZigClangFieldDecl_getLocation(*struct_ZigClangFieldDecl) struct_ZigClangSourceLocation;

pub extern fn ZigClangEnumConstantDecl_getInitExpr(*ZigClangEnumConstantDecl) ?*ZigClangExpr;
pub extern fn ZigClangEnumConstantDecl_getInitVal(*ZigClangEnumConstantDecl) *ZigClangAPSInt;

pub extern fn ZigClangASTUnit_getLocalPreprocessingEntities_begin(*ZigClangASTUnit) ZigClangPreprocessingRecord_iterator;
pub extern fn ZigClangASTUnit_getLocalPreprocessingEntities_end(*ZigClangASTUnit) ZigClangPreprocessingRecord_iterator;
pub extern fn ZigClangPreprocessingRecord_iterator_deref(ZigClangPreprocessingRecord_iterator) *ZigClangPreprocessedEntity;
pub extern fn ZigClangPreprocessedEntity_getKind(*ZigClangPreprocessedEntity) ZigClangPreprocessedEntity_EntityKind;

pub extern fn ZigClangMacroDefinitionRecord_getName_getNameStart(*ZigClangMacroDefinitionRecord) [*:0]u8;
pub extern fn ZigClangMacroDefinitionRecord_getSourceRange_getBegin(*ZigClangMacroDefinitionRecord) ZigClangSourceLocation;
pub extern fn ZigClangMacroDefinitionRecord_getSourceRange_getEnd(*ZigClangMacroDefinitionRecord) ZigClangSourceLocation;

pub extern fn ZigClangMacroExpansion_getDefinition(*ZigClangMacroExpansion) *ZigClangMacroDefinitionRecord;

pub extern fn ZigClangIfStmt_getThen(*ZigClangIfStmt) *ZigClangStmt;
pub extern fn ZigClangIfStmt_getElse(*ZigClangIfStmt) ?*ZigClangStmt;
pub extern fn ZigClangIfStmt_getCond(*ZigClangIfStmt) *ZigClangStmt;

pub extern fn ZigClangWhileStmt_getCond(*ZigClangWhileStmt) *ZigClangExpr;
pub extern fn ZigClangWhileStmt_getBody(*ZigClangWhileStmt) *ZigClangStmt;

pub extern fn ZigClangDoStmt_getCond(*ZigClangDoStmt) *ZigClangExpr;
pub extern fn ZigClangDoStmt_getBody(*ZigClangDoStmt) *ZigClangStmt;

pub extern fn ZigClangForStmt_getInit(*ZigClangForStmt) ?*ZigClangStmt;
pub extern fn ZigClangForStmt_getCond(*ZigClangForStmt) ?*ZigClangExpr;
pub extern fn ZigClangForStmt_getInc(*ZigClangForStmt) ?*ZigClangExpr;
pub extern fn ZigClangForStmt_getBody(*ZigClangForStmt) *ZigClangStmt;

pub extern fn ZigClangAPFloat_toString(self: *ZigClangAPFloat, precision: c_uint, maxPadding: c_uint, truncateZero: bool) [*:0]u8;
pub extern fn ZigClangAPFloat_getValueAsApproximateDouble(*ZigClangFloatingLiteral) f64;

pub extern fn ZigClangAbstractConditionalOperator_getCond(*ZigClangAbstractConditionalOperator) *ZigClangExpr;
pub extern fn ZigClangAbstractConditionalOperator_getTrueExpr(*ZigClangAbstractConditionalOperator) *ZigClangExpr;
pub extern fn ZigClangAbstractConditionalOperator_getFalseExpr(*ZigClangAbstractConditionalOperator) *ZigClangExpr;

pub extern fn ZigClangSwitchStmt_getConditionVariableDeclStmt(*ZigClangSwitchStmt) ?*ZigClangDeclStmt;
pub extern fn ZigClangSwitchStmt_getCond(*ZigClangSwitchStmt) *ZigClangExpr;
pub extern fn ZigClangSwitchStmt_getBody(*ZigClangSwitchStmt) *ZigClangStmt;
pub extern fn ZigClangSwitchStmt_isAllEnumCasesCovered(*ZigClangSwitchStmt) bool;

pub extern fn ZigClangCaseStmt_getLHS(*ZigClangCaseStmt) *ZigClangExpr;
pub extern fn ZigClangCaseStmt_getRHS(*ZigClangCaseStmt) ?*ZigClangExpr;
pub extern fn ZigClangCaseStmt_getBeginLoc(*ZigClangCaseStmt) ZigClangSourceLocation;
pub extern fn ZigClangCaseStmt_getSubStmt(*ZigClangCaseStmt) *ZigClangStmt;

pub extern fn ZigClangDefaultStmt_getSubStmt(*ZigClangDefaultStmt) *ZigClangStmt;

pub extern fn ZigClangExpr_EvaluateAsConstantExpr(*ZigClangExpr, *ZigClangExprEvalResult, ZigClangExpr_ConstExprUsage, *ZigClangASTContext) bool;

pub extern fn ZigClangPredefinedExpr_getFunctionName(*ZigClangPredefinedExpr) *ZigClangStringLiteral;

pub extern fn ZigClangCharacterLiteral_getBeginLoc(*ZigClangCharacterLiteral) ZigClangSourceLocation;
pub extern fn ZigClangCharacterLiteral_getKind(*ZigClangCharacterLiteral) ZigClangCharacterLiteral_CharacterKind;
pub extern fn ZigClangCharacterLiteral_getValue(*ZigClangCharacterLiteral) c_uint;

pub extern fn ZigClangStmtExpr_getSubStmt(*ZigClangStmtExpr) *ZigClangCompoundStmt;

pub extern fn ZigClangMemberExpr_getBase(*ZigClangMemberExpr) *ZigClangExpr;
pub extern fn ZigClangMemberExpr_isArrow(*ZigClangMemberExpr) bool;
pub extern fn ZigClangMemberExpr_getMemberDecl(*ZigClangMemberExpr) *ZigClangValueDecl;

pub extern fn ZigClangArraySubscriptExpr_getBase(*ZigClangArraySubscriptExpr) *ZigClangExpr;
pub extern fn ZigClangArraySubscriptExpr_getIdx(*ZigClangArraySubscriptExpr) *ZigClangExpr;

pub extern fn ZigClangCallExpr_getCallee(*ZigClangCallExpr) *ZigClangExpr;
pub extern fn ZigClangCallExpr_getNumArgs(*ZigClangCallExpr) c_uint;
pub extern fn ZigClangCallExpr_getArgs(*ZigClangCallExpr) [*]*ZigClangExpr;

pub extern fn ZigClangUnaryExprOrTypeTraitExpr_getTypeOfArgument(*ZigClangUnaryExprOrTypeTraitExpr) ZigClangQualType;
pub extern fn ZigClangUnaryExprOrTypeTraitExpr_getBeginLoc(*ZigClangUnaryExprOrTypeTraitExpr) ZigClangSourceLocation;

pub extern fn ZigClangUnaryOperator_getOpcode(*ZigClangUnaryOperator) ZigClangUO;
pub extern fn ZigClangUnaryOperator_getType(*ZigClangUnaryOperator) ZigClangQualType;
pub extern fn ZigClangUnaryOperator_getSubExpr(*ZigClangUnaryOperator) *ZigClangExpr;
pub extern fn ZigClangUnaryOperator_getBeginLoc(*ZigClangUnaryOperator) ZigClangSourceLocation;

pub extern fn ZigClangOpaqueValueExpr_getSourceExpr(*ZigClangOpaqueValueExpr) ?*ZigClangExpr;

pub extern fn ZigClangCompoundAssignOperator_getType(*ZigClangCompoundAssignOperator) ZigClangQualType;
pub extern fn ZigClangCompoundAssignOperator_getComputationLHSType(*ZigClangCompoundAssignOperator) ZigClangQualType;
pub extern fn ZigClangCompoundAssignOperator_getComputationResultType(*ZigClangCompoundAssignOperator) ZigClangQualType;
pub extern fn ZigClangCompoundAssignOperator_getBeginLoc(*ZigClangCompoundAssignOperator) ZigClangSourceLocation;
pub extern fn ZigClangCompoundAssignOperator_getOpcode(*ZigClangCompoundAssignOperator) ZigClangBO;
pub extern fn ZigClangCompoundAssignOperator_getLHS(*ZigClangCompoundAssignOperator) *ZigClangExpr;
pub extern fn ZigClangCompoundAssignOperator_getRHS(*ZigClangCompoundAssignOperator) *ZigClangExpr;
