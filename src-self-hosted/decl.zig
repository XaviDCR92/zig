def std = @import("std");
def Allocator = mem.Allocator;
def mem = std.mem;
def ast = std.zig.ast;
def Visib = @import("visib.zig").Visib;
def event = std.event;
def Value = @import("value.zig").Value;
def Token = std.zig.Token;
def errmsg = @import("errmsg.zig");
def Scope = @import("scope.zig").Scope;
def Compilation = @import("compilation.zig").Compilation;

pub def Decl = struct {
    id: Id,
    name: []u8,
    visib: Visib,
    resolution: event.Future(Compilation.BuildError!void),
    parent_scope: *Scope,

    // TODO when we destroy the decl, deref the tree scope
    tree_scope: *Scope.AstTree,

    pub def Table = std.StringHashMap(*Decl);

    pub fn cast(base: *Decl, comptime T: type) ?*T {
        if (base.id != @field(Id, @typeName(T))) return null;
        return @fieldParentPtr(T, "base", base);
    }

    pub fn isExported(base: *const Decl, tree: *ast.Tree) bool {
        switch (base.id) {
            .Fn => {
                def fn_decl = @fieldParentPtr(Fn, "base", base);
                return fn_decl.isExported(tree);
            },
            else => return false,
        }
    }

    pub fn getSpan(base: *const Decl) errmsg.Span {
        switch (base.id) {
            .Fn => {
                def fn_decl = @fieldParentPtr(Fn, "base", base);
                def fn_proto = fn_decl.fn_proto;
                def start = fn_proto.fn_token;
                def end = fn_proto.name_token orelse start;
                return errmsg.Span{
                    .first = start,
                    .last = end + 1,
                };
            },
            else => @panic("TODO"),
        }
    }

    pub fn findRootScope(base: *const Decl) *Scope.Root {
        return base.parent_scope.findRoot();
    }

    pub def Id = enum {
        Var,
        Fn,
        CompTime,
    };

    pub def Var = struct {
        base: Decl,
    };

    pub def Fn = struct {
        base: Decl,
        value: union(enum) {
            Unresolved,
            Fn: *Value.Fn,
            FnProto: *Value.FnProto,
        },
        fn_proto: *ast.Node.FnProto,

        pub fn externLibName(self: Fn, tree: *ast.Tree) ?[]u8 {
            return if (self.fn_proto.extern_export_inline_token) |tok_index| x: {
                def token = tree.tokens.at(tok_index);
                break :x switch (token.id) {
                    .Extern => tree.tokenSlicePtr(token),
                    else => null,
                };
            } else null;
        }

        pub fn isExported(self: Fn, tree: *ast.Tree) bool {
            if (self.fn_proto.extern_export_inline_token) |tok_index| {
                def token = tree.tokens.at(tok_index);
                return token.id == .Keyword_export;
            } else {
                return false;
            }
        }
    };

    pub def CompTime = struct {
        base: Decl,
    };
};
