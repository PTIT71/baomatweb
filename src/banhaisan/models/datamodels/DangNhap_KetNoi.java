package banhaisan.models.datamodels;

public class DangNhap_KetNoi {
    private String ipAddress;
    private String hoTen;
    private String email;
    private String passWord;
    private boolean valid;
    private boolean Admin;
    private String maNguoiDung;

    public String getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public DangNhap_KetNoi(String ipAddress, String hoTen, String email, String passWord, boolean valid, boolean admin, String maNguoiDung) {
        this.ipAddress = ipAddress;
        this.hoTen = hoTen;
        this.email = email;
        this.passWord = passWord;
        this.valid = valid;
        Admin = admin;
        this.maNguoiDung = maNguoiDung;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    public void setAdmin(boolean admin) {
        Admin = admin;
    }


    public boolean isAdmin() {
        return Admin;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }


    public DangNhap_KetNoi() {
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
}
