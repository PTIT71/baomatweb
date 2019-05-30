package banhaisan.models.datamodels;

public class SanPham_GioHang {
    private SanPham sp = new SanPham();
    private int slSanPham;

    public SanPham_GioHang(SanPham sp, int slSanPham) {
        super();
        this.sp = sp;
        this.slSanPham = slSanPham;
    }
    public SanPham_GioHang(){}

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }

    public int getSlSanPham() {
        return slSanPham;
    }

    public void setSlSanPham(int slSanPham) {
        this.slSanPham = slSanPham;
    }
}
