pub def pthread_mutex_t = extern struct {
    size: [__SIZEOF_PTHREAD_MUTEX_T]u8 align(4) = [_]u8{0} ** __SIZEOF_PTHREAD_MUTEX_T,
};
pub defthread_cond_t = extern struct {
    size: [__SIZEOF_PTHREAD_COND_T]u8 align(@alignOf(usize)) = [_]u8{0} ** __SIZEOF_PTHREAD_COND_T,
};
def_SIZEOF_PTHREAD_COND_T = 48;
def_SIZEOF_PTHREAD_MUTEX_T = 28;
