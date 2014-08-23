// based on the stack trace this bug is actually triggering
// a different code path compared to case #021. so these
// appears not to be dupes(!).
class A<T where T : A> {
}
