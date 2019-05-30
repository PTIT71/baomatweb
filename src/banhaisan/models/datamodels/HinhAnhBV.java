package banhaisan.models.datamodels;

public class HinhAnhBV {
    private String maBV;
    private String url;

    public HinhAnhBV() {
    }

    public HinhAnhBV(String maBV, String url) {
        this.maBV = maBV;
        this.url = url;
    }

    public String getMaBV() {
        return maBV;
    }

    public void setMaBV(String maBV) {
        this.maBV = maBV;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
