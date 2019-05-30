package banhaisan.models.datamodels;

import java.sql.Date;

public class SanPham {
    private String maSP;
    private String tenSP;
    private double giaSP;
    private float phanTramKhuyenMai;
    private String maDanhMuc;
    private String xuatXu;
    private String moTa;
    private Date ngayNhap;
    private String urlHinhAnh;

    public String getUrlHinhAnh() {
        return urlHinhAnh;
    }

    public void setUrlHinhAnh(String urlHinhAnh) {
        this.urlHinhAnh = urlHinhAnh;
    }

    public SanPham(String maSP, String tenSP, double giaSP, float phanTramKhuyenMai, String maDanhMuc, String xuatXu, String moTa, Date ngayNhap, String urlHinhAnh) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.giaSP = giaSP;
        this.phanTramKhuyenMai = phanTramKhuyenMai;
        this.maDanhMuc = maDanhMuc;
        this.xuatXu = xuatXu;
        this.moTa = moTa;
        this.ngayNhap = ngayNhap;
        this.urlHinhAnh = urlHinhAnh;
    }

    public SanPham() {    }


    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public double getGiaSP() {
        return giaSP;
    }

    public void setGiaSP(double giaSP) {
        this.giaSP = giaSP;
    }

    public float getPhanTramKhuyenMai() {
        return phanTramKhuyenMai;
    }

    public void setPhanTramKhuyenMai(float phanTramKhuyenMai) {
        this.phanTramKhuyenMai = phanTramKhuyenMai;
    }

    public String getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(String maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public String getXuatXu() {
        return xuatXu;
    }

    public void setXuatXu(String xuatXu) {
        this.xuatXu = xuatXu;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Date getNgayNhap() {
        return ngayNhap;
    }

    public void setNgayNhap(Date ngayNhap) {
        this.ngayNhap = ngayNhap;
    }
}
