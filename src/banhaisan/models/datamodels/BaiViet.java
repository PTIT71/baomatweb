package banhaisan.models.datamodels;

import java.util.Date;

public class BaiViet {
    private String maBaiViet;
    private String tieuDe;
    private String noiDung;
    private Date ngayDang;
    private String maDanhMuc;
    private String urlHinhAnh;

    public String getUrlHinhAnh() {
        return urlHinhAnh;
    }

    public void setUrlHinhAnh(String urlHinhAnh) {
        this.urlHinhAnh = urlHinhAnh;
    }

    public BaiViet(String maBaiViet, String tieuDe, String noiDung, Date ngayDang, String maDanhMuc, String urlHinhAnh) {
        this.maBaiViet = maBaiViet;
        this.tieuDe = tieuDe;
        this.noiDung = noiDung;
        this.ngayDang = ngayDang;
        this.maDanhMuc = maDanhMuc;
        this.urlHinhAnh = urlHinhAnh;
    }

    public BaiViet() {
    }



    public String getMaBaiViet() {
        return maBaiViet;
    }

    public void setMaBaiViet(String maBaiViet) {
        this.maBaiViet = maBaiViet;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public Date getNgayDang() {
        return ngayDang;
    }

    public void setNgayDang(Date ngayDang) {
        this.ngayDang = ngayDang;
    }

    public String getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(String maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }
}
