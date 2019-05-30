package banhaisan.models.datamodels;

public class DonHang_SanPham extends SanPham{
    private String maDonHang;
    private String maSP;
    private int soLuong;
    private double gia;

    public String getMaDonHang() {
        return maDonHang;
    }

    public void setMaDonHang(String maDonHang) {
        this.maDonHang = maDonHang;
    }

    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public DonHang_SanPham(String maDonHang, String maSP, int soLuong, double gia) {
        this.maDonHang = maDonHang;
        this.maSP = maSP;
        this.soLuong = soLuong;
        this.gia = gia;
    }
    public DonHang_SanPham(){}

}
