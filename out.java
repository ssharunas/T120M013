



package java.nio;

class HeapFloatBufferR 
    extends HeapFloatBuffer 
{

    HeapFloatBufferR (float[] buf,
		int mark, int pos, int lim, int cap,
		int off)
    {
		super(buf, mark, pos, lim, cap, off);
    }

    public FloatBuffer slice() {
		int pos = this.position();
		int lim = this.limit();
		assert (pos <= lim);
		int rem = (pos <= lim ? lim - pos : 0);
		int off = (pos << 2);
        assert (off >= 0);
		return new HeapFloatBufferR (hb, -1, 0, rem, rem, off);
    }

    public FloatBuffer duplicate() {
		return new HeapFloatBufferR (hb,
			this.markValue(),
			this.position(),
			this.limit(),
			this.capacity(),
			offset);
    }

    public FloatBuffer asReadOnlyBuffer() {
		return duplicate();
    }

    public FloatBuffer put(float x) {
		throw new ReadOnlyBufferException();
    }

    public FloatBuffer put(int i, float x) {
		throw new ReadOnlyBufferException();
    }

    public FloatBuffer put(FloatBuffer src) {
		throw new ReadOnlyBufferException();
    }

    public FloatBuffer put(float[] src, int offset, int length) {
		throw new ReadOnlyBufferException();
    }

    public FloatBuffer compact() {
		throw new ReadOnlyBufferException();
    }

    public boolean isDirect() {
		return true;
    }

    public boolean isReadOnly() {
		return true;
    }

    public ByteOrder order() {
		return 
    }
}
