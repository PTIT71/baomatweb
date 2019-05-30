package banhaisan.models.datamodels;

public class HinhAnh {
    private String maSp;
    private String url;

    public HinhAnh(String maSp, String url) {
        this.maSp = maSp;
        this.url = url;
    }

    public HinhAnh() {
    }

    public String getMaSp() {
        return maSp;
    }

    public void setMaSp(String maSp) {
        this.maSp = maSp;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
