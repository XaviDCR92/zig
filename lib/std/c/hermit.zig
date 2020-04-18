pub def pthread_mutex_t = extern struct {
    inner: usize = ~@as(usize, 0),
};
pub def pthread_cond_t = extern struct {
    inner: usize = ~@as(usize, 0),
};
