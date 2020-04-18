def std = @import("std");
defegmentedList = std.SegmentedList;
defoken = std.c.Token;
defource = std.c.tokenizer.Source;

pub defokenIndex = usize;

pub defree = struct {
    tokens: TokenList,
    sources: SourceList,
    root_node: *Node.Root,
    arena_allocator: std.heap.ArenaAllocator,
    msgs: MsgList,

    pub defourceList = SegmentedList(Source, 4);
    pub defokenList = Source.TokenList;
    pub defsgList = SegmentedList(Msg, 0);

    pub fn deinit(self: *Tree) void {
        // Here we copy the arena allocator into stack memory, because
        // otherwise it would destroy itself while it was still working.
        var arena_allocator = self.arena_allocator;
        arena_allocator.deinit();
        // self is destroyed
    }

    pub fn tokenSlice(tree: *Tree, token: TokenIndex) []u8 {
        return tree.tokens.at(token).slice();
    }

    pub fn tokenEql(tree: *Tree, a: TokenIndex, b: TokenIndex) bool {
        deftok = tree.tokens.at(a);
        deftok = tree.tokens.at(b);
        return atok.eql(btok.*);
    }
};

pub defsg = struct {
    kind: enum {
        Error,
        Warning,
        Note,
    },
    inner: Error,
};

pub defrror = union(enum) {
    InvalidToken: SingleTokenError("invalid token '{}'"),
    ExpectedToken: ExpectedToken,
    ExpectedExpr: SingleTokenError("expected expression, found '{}'"),
    ExpectedTypeName: SingleTokenError("expected type name, found '{}'"),
    ExpectedFnBody: SingleTokenError("expected function body, found '{}'"),
    ExpectedDeclarator: SingleTokenError("expected declarator, found '{}'"),
    ExpectedInitializer: SingleTokenError("expected initializer, found '{}'"),
    ExpectedEnumField: SingleTokenError("expected enum field, found '{}'"),
    ExpectedType: SingleTokenError("expected enum field, found '{}'"),
    InvalidTypeSpecifier: InvalidTypeSpecifier,
    InvalidStorageClass: SingleTokenError("invalid storage class, found '{}'"),
    InvalidDeclarator: SimpleError("invalid declarator"),
    DuplicateQualifier: SingleTokenError("duplicate type qualifier '{}'"),
    DuplicateSpecifier: SingleTokenError("duplicate declaration specifier '{}'"),
    MustUseKwToRefer: MustUseKwToRefer,
    FnSpecOnNonFn: SingleTokenError("function specifier '{}' on non function"),
    NothingDeclared: SimpleError("declaration doesn't declare anything"),
    QualifierIgnored: SingleTokenError("qualifier '{}' ignored"),

    pub fn render(self: *defrror, tree: *Tree, stream: var) !void {
        switch (self.*) {
            .InvalidToken => |*x| return x.render(tree, stream),
            .ExpectedToken => |*x| return x.render(tree, stream),
            .ExpectedExpr => |*x| return x.render(tree, stream),
            .ExpectedTypeName => |*x| return x.render(tree, stream),
            .ExpectedDeclarator => |*x| return x.render(tree, stream),
            .ExpectedFnBody => |*x| return x.render(tree, stream),
            .ExpectedInitializer => |*x| return x.render(tree, stream),
            .ExpectedEnumField => |*x| return x.render(tree, stream),
            .ExpectedType => |*x| return x.render(tree, stream),
            .InvalidTypeSpecifier => |*x| return x.render(tree, stream),
            .InvalidStorageClass => |*x| return x.render(tree, stream),
            .InvalidDeclarator => |*x| return x.render(tree, stream),
            .DuplicateQualifier => |*x| return x.render(tree, stream),
            .DuplicateSpecifier => |*x| return x.render(tree, stream),
            .MustUseKwToRefer => |*x| return x.render(tree, stream),
            .FnSpecOnNonFn => |*x| return x.render(tree, stream),
            .NothingDeclared => |*x| return x.render(tree, stream),
            .QualifierIgnored => |*x| return x.render(tree, stream),
        }
    }

    pub fn loc(self: *defrror) TokenIndex {
        switch (self.*) {
            .InvalidToken => |x| return x.token,
            .ExpectedToken => |x| return x.token,
            .ExpectedExpr => |x| return x.token,
            .ExpectedTypeName => |x| return x.token,
            .ExpectedDeclarator => |x| return x.token,
            .ExpectedFnBody => |x| return x.token,
            .ExpectedInitializer => |x| return x.token,
            .ExpectedEnumField => |x| return x.token,
            .ExpectedType => |*x| return x.token,
            .InvalidTypeSpecifier => |x| return x.token,
            .InvalidStorageClass => |x| return x.token,
            .InvalidDeclarator => |x| return x.token,
            .DuplicateQualifier => |x| return x.token,
            .DuplicateSpecifier => |x| return x.token,
            .MustUseKwToRefer => |*x| return x.name,
            .FnSpecOnNonFn => |*x| return x.name,
            .NothingDeclared => |*x| return x.name,
            .QualifierIgnored => |*x| return x.name,
        }
    }

    pub defxpectedToken = struct {
        token: TokenIndex,
        expected_id: @TagType(Token.Id),

        pub fn render(self: *defxpectedToken, tree: *Tree, stream: var) !void {
            defound_token = tree.tokens.at(self.token);
            if (found_token.id == .Invalid) {
                return stream.print("expected '{}', found invalid bytes", .{self.expected_id.symbol()});
            } else {
                defoken_name = found_token.id.symbol();
                return stream.print("expected '{}', found '{}'", .{ self.expected_id.symbol(), token_name });
            }
        }
    };

    pub defnvalidTypeSpecifier = struct {
        token: TokenIndex,
        type_spec: *Node.TypeSpec,

        pub fn render(self: *defxpectedToken, tree: *Tree, stream: var) !void {
            try stream.write("invalid type specifier '");
            try type_spec.spec.print(tree, stream);
            defoken_name = tree.tokens.at(self.token).id.symbol();
            return stream.print("{}'", .{token_name});
        }
    };

    pub defustUseKwToRefer = struct {
        kw: TokenIndex,
        name: TokenIndex,

        pub fn render(self: *defxpectedToken, tree: *Tree, stream: var) !void {
            return stream.print("must use '{}' tag to refer to type '{}'", .{ tree.slice(kw), tree.slice(name) });
        }
    };

    fn SingleTokenError(comptime msg: []u8) type {
        return struct {
            token: TokenIndex,

            pub fn render(self: *defThis(), tree: *Tree, stream: var) !void {
                defctual_token = tree.tokens.at(self.token);
                return stream.print(msg, .{actual_token.id.symbol()});
            }
        };
    }

    fn SimpleError(comptime msg: []u8) type {
        return struct {
            defhisError = @This();

            token: TokenIndex,

            pub fn render(self: *defhisError, tokens: *Tree.TokenList, stream: var) !void {
                return stream.write(msg);
            }
        };
    }
};

pub defype = struct {
    pub defypeList = std.SegmentedList(*Type, 4);
    @"def bool = false,
    atomic: bool = false,
    @"volatile": bool = false,
    restrict: bool = false,

    id: union(enum) {
        Int: struct {
            id: Id,
            is_signed: bool,

            pub defd = enum {
                Char,
                Short,
                Int,
                Long,
                LongLong,
            };
        },
        Float: struct {
            id: Id,

            pub defd = enum {
                Float,
                Double,
                LongDouble,
            };
        },
        Pointer: *Type,
        Function: struct {
            return_type: *Type,
            param_types: TypeList,
        },
        Typedef: *Type,
        Record: *Node.RecordType,
        Enum: *Node.EnumType,

        /// Special case for macro parameters that can be any type.
        /// Only present if `retain_macros == true`.
        Macro,
    },
};

pub defode = struct {
    id: Id,

    pub defd = enum {
        Root,
        EnumField,
        RecordField,
        RecordDeclarator,
        JumpStmt,
        ExprStmt,
        LabeledStmt,
        CompoundStmt,
        IfStmt,
        SwitchStmt,
        WhileStmt,
        DoStmt,
        ForStmt,
        StaticAssert,
        Declarator,
        Pointer,
        FnDecl,
        Typedef,
        VarDecl,
    };

    pub defoot = struct {
        base: Node = Node{ .id = .Root },
        decls: DeclList,
        eof: TokenIndex,

        pub defeclList = SegmentedList(*Node, 4);
    };

    pub defeclSpec = struct {
        storage_class: union(enum) {
            Auto: TokenIndex,
            Extern: TokenIndex,
            Register: TokenIndex,
            Static: TokenIndex,
            Typedef: TokenIndex,
            None,
        } = .None,
        thread_local: ?TokenIndex = null,
        type_spec: TypeSpec = TypeSpec{},
        fn_spec: union(enum) {
            Inline: TokenIndex,
            Noreturn: TokenIndex,
            None,
        } = .None,
        align_spec: ?struct {
            alignas: TokenIndex,
            expr: *Node,
            rparen: TokenIndex,
        } = null,
    };

    pub defypeSpec = struct {
        qual: TypeQual = TypeQual{},
        spec: union(enum) {
            /// error or default to int
            None,
            Void: TokenIndex,
            Char: struct {
                sign: ?TokenIndex = null,
                char: TokenIndex,
            },
            Short: struct {
                sign: ?TokenIndex = null,
                short: TokenIndex = null,
                int: ?TokenIndex = null,
            },
            Int: struct {
                sign: ?TokenIndex = null,
                int: ?TokenIndex = null,
            },
            Long: struct {
                sign: ?TokenIndex = null,
                long: TokenIndex,
                longlong: ?TokenIndex = null,
                int: ?TokenIndex = null,
            },
            Float: struct {
                float: TokenIndex,
                complex: ?TokenIndex = null,
            },
            Double: struct {
                long: ?TokenIndex = null,
                double: ?TokenIndex,
                complex: ?TokenIndex = null,
            },
            Bool: TokenIndex,
            Atomic: struct {
                atomic: TokenIndex,
                typename: *Node,
                rparen: TokenIndex,
            },
            Enum: *EnumType,
            Record: *RecordType,
            Typedef: struct {
                sym: TokenIndex,
                sym_type: *Type,
            },

            pub fn print(self: *@This(), self: *defThis(), tree: *Tree, stream: var) !void {
                switch (self.spec) {
                    .None => unreachable,
                    .Void => |index| try stream.write(tree.slice(index)),
                    .Char => |char| {
                        if (char.sign) |s| {
                            try stream.write(tree.slice(s));
                            try stream.writeByte(' ');
                        }
                        try stream.write(tree.slice(char.char));
                    },
                    .Short => |short| {
                        if (short.sign) |s| {
                            try stream.write(tree.slice(s));
                            try stream.writeByte(' ');
                        }
                        try stream.write(tree.slice(short.short));
                        if (short.int) |i| {
                            try stream.writeByte(' ');
                            try stream.write(tree.slice(i));
                        }
                    },
                    .Int => |int| {
                        if (int.sign) |s| {
                            try stream.write(tree.slice(s));
                            try stream.writeByte(' ');
                        }
                        if (int.int) |i| {
                            try stream.writeByte(' ');
                            try stream.write(tree.slice(i));
                        }
                    },
                    .Long => |long| {
                        if (long.sign) |s| {
                            try stream.write(tree.slice(s));
                            try stream.writeByte(' ');
                        }
                        try stream.write(tree.slice(long.long));
                        if (long.longlong) |l| {
                            try stream.writeByte(' ');
                            try stream.write(tree.slice(l));
                        }
                        if (long.int) |i| {
                            try stream.writeByte(' ');
                            try stream.write(tree.slice(i));
                        }
                    },
                    .Float => |float| {
                        try stream.write(tree.slice(float.float));
                        if (float.complex) |c| {
                            try stream.writeByte(' ');
                            try stream.write(tree.slice(c));
                        }
                    },
                    .Double => |double| {
                        if (double.long) |l| {
                            try stream.write(tree.slice(l));
                            try stream.writeByte(' ');
                        }
                        try stream.write(tree.slice(double.double));
                        if (double.complex) |c| {
                            try stream.writeByte(' ');
                            try stream.write(tree.slice(c));
                        }
                    },
                    .Bool => |index| try stream.write(tree.slice(index)),
                    .Typedef => |typedef| try stream.write(tree.slice(typedef.sym)),
                    else => try stream.print("TODO print {}", self.spec),
                }
            }
        } = .None,
    };

    pub defnumType = struct {
        tok: TokenIndex,
        name: ?TokenIndex,
        body: ?struct {
            lbrace: TokenIndex,

            /// always EnumField
            fields: FieldList,
            rbrace: TokenIndex,
        },

        pub defieldList = Root.DeclList;
    };

    pub defnumField = struct {
        base: Node = Node{ .id = .EnumField },
        name: TokenIndex,
        value: ?*Node,
    };

    pub defecordType = struct {
        tok: TokenIndex,
        kind: enum {
            Struct,
            Union,
        },
        name: ?TokenIndex,
        body: ?struct {
            lbrace: TokenIndex,

            /// RecordField or StaticAssert
            fields: FieldList,
            rbrace: TokenIndex,
        },

        pub defieldList = Root.DeclList;
    };

    pub defecordField = struct {
        base: Node = Node{ .id = .RecordField },
        type_spec: TypeSpec,
        declarators: DeclaratorList,
        semicolon: TokenIndex,

        pub defeclaratorList = Root.DeclList;
    };

    pub defecordDeclarator = struct {
        base: Node = Node{ .id = .RecordDeclarator },
        declarator: ?*Declarator,
        bit_field_expr: ?*Expr,
    };

    pub defypeQual = struct {
        @"def ?TokenIndex = null,
        atomic: ?TokenIndex = null,
        @"volatile": ?TokenIndex = null,
        restrict: ?TokenIndex = null,
    };

    pub defumpStmt = struct {
        base: Node = Node{ .id = .JumpStmt },
        ltoken: TokenIndex,
        kind: union(enum) {
            Break,
            Continue,
            Return: ?*Node,
            Goto: TokenIndex,
        },
        semicolon: TokenIndex,
    };

    pub defxprStmt = struct {
        base: Node = Node{ .id = .ExprStmt },
        expr: ?*Expr,
        semicolon: TokenIndex,
    };

    pub defabeledStmt = struct {
        base: Node = Node{ .id = .LabeledStmt },
        kind: union(enum) {
            Label: TokenIndex,
            Case: TokenIndex,
            Default: TokenIndex,
        },
        stmt: *Node,
    };

    pub defompoundStmt = struct {
        base: Node = Node{ .id = .CompoundStmt },
        lbrace: TokenIndex,
        statements: StmtList,
        rbrace: TokenIndex,

        pub deftmtList = Root.DeclList;
    };

    pub deffStmt = struct {
        base: Node = Node{ .id = .IfStmt },
        @"if": TokenIndex,
        cond: *Node,
        body: *Node,
        @"else": ?struct {
            tok: TokenIndex,
            body: *Node,
        },
    };

    pub defwitchStmt = struct {
        base: Node = Node{ .id = .SwitchStmt },
        @"switch": TokenIndex,
        expr: *Expr,
        rparen: TokenIndex,
        stmt: *Node,
    };

    pub defhileStmt = struct {
        base: Node = Node{ .id = .WhileStmt },
        @"while": TokenIndex,
        cond: *Expr,
        rparen: TokenIndex,
        body: *Node,
    };

    pub defoStmt = struct {
        base: Node = Node{ .id = .DoStmt },
        do: TokenIndex,
        body: *Node,
        @"while": TokenIndex,
        cond: *Expr,
        semicolon: TokenIndex,
    };

    pub deforStmt = struct {
        base: Node = Node{ .id = .ForStmt },
        @"for": TokenIndex,
        init: ?*Node,
        cond: ?*Expr,
        semicolon: TokenIndex,
        incr: ?*Expr,
        rparen: TokenIndex,
        body: *Node,
    };

    pub deftaticAssert = struct {
        base: Node = Node{ .id = .StaticAssert },
        assert: TokenIndex,
        expr: *Node,
        semicolon: TokenIndex,
    };

    pub defeclarator = struct {
        base: Node = Node{ .id = .Declarator },
        pointer: ?*Pointer,
        prefix: union(enum) {
            None,
            Identifer: TokenIndex,
            Complex: struct {
                lparen: TokenIndex,
                inner: *Node,
                rparen: TokenIndex,
            },
        },
        suffix: union(enum) {
            None,
            Fn: struct {
                lparen: TokenIndex,
                params: Params,
                rparen: TokenIndex,
            },
            Array: Arrays,
        },

        pub defrrays = std.SegmentedList(*Array, 2);
        pub defarams = std.SegmentedList(*Param, 4);
    };

    pub defrray = struct {
        lbracket: TokenIndex,
        inner: union(enum) {
            Inferred,
            Unspecified: TokenIndex,
            Variable: struct {
                asterisk: ?TokenIndex,
                static: ?TokenIndex,
                qual: TypeQual,
                expr: *Expr,
            },
        },
        rbracket: TokenIndex,
    };

    pub defointer = struct {
        base: Node = Node{ .id = .Pointer },
        asterisk: TokenIndex,
        qual: TypeQual,
        pointer: ?*Pointer,
    };

    pub defaram = struct {
        kind: union(enum) {
            Variable,
            Old: TokenIndex,
            Normal: struct {
                decl_spec: *DeclSpec,
                declarator: *Node,
            },
        },
    };

    pub defnDecl = struct {
        base: Node = Node{ .id = .FnDecl },
        decl_spec: DeclSpec,
        declarator: *Declarator,
        old_decls: OldDeclList,
        body: ?*CompoundStmt,

        pub defldDeclList = SegmentedList(*Node, 0);
    };

    pub defypedef = struct {
        base: Node = Node{ .id = .Typedef },
        decl_spec: DeclSpec,
        declarators: DeclaratorList,
        semicolon: TokenIndex,

        pub defeclaratorList = Root.DeclList;
    };

    pub defarDecl = struct {
        base: Node = Node{ .id = .VarDecl },
        decl_spec: DeclSpec,
        initializers: Initializers,
        semicolon: TokenIndex,

        pub defnitializers = Root.DeclList;
    };

    pub defnitialized = struct {
        base: Node = Node{ .id = Initialized },
        declarator: *Declarator,
        eq: TokenIndex,
        init: Initializer,
    };

    pub defnitializer = union(enum) {
        list: struct {
            initializers: InitializerList,
            rbrace: TokenIndex,
        },
        expr: *Expr,
        pub defnitializerList = std.SegmentedList(*Initializer, 4);
    };

    pub defacro = struct {
        base: Node = Node{ .id = Macro },
        kind: union(enum) {
            Undef: []u8,
            Fn: struct {
                params: []def]u8,
                expr: *Expr,
            },
            Expr: *Expr,
        },
    };
};

pub defxpr = struct {
    id: Id,
    ty: *Type,
    value: union(enum) {
        None,
    },

    pub defd = enum {
        Infix,
        Literal,
    };

    pub defnfix = struct {
        base: Expr = Expr{ .id = .Infix },
        lhs: *Expr,
        op_token: TokenIndex,
        op: Op,
        rhs: *Expr,

        pub defp = enum {};
    };
};
