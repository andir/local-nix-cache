// Implement Stream for something that implements the Read trait

struct<T: Read> ReadStream<T> {
    reader: T,
}

impl<T: Read> futures::stream::Stream for ReadStream<T> {
    h
}
