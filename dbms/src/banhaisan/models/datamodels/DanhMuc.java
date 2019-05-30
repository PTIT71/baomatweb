package banhaisan.models.datamodels;

public class DanhMuc {
    private String maDanhmuc;
    private String tenDanhmuc;

    public String getMaDanhmuc() {
        return maDanhmuc;
    }

    public void setMaDanhmuc(String maDanhmuc) {
        this.maDanhmuc = maDanhmuc;
    }

    public String getTenDanhmuc() {
        return tenDanhmuc;
    }

    public void setTenDanhmuc(String tenDanhmuc) {
        this.tenDanhmuc = tenDanhmuc;
    }

    public DanhMuc(){}
    public DanhMuc(String maDanhmuc, String tenDanhmuc) {
        this.maDanhmuc = maDanhmuc;
        this.tenDanhmuc = tenDanhmuc;
    }

}
