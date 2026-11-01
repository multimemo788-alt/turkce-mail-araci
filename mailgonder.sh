#!/bin/bash

clear
echo "===================================="
echo "    GELİŞMİŞ MAIL GÖNDERME ARACI    "
echo "===================================="
echo ""

# Kullanıcıdan tüm dinamik bilgileri isteyelim
read -p "Gönderen E-posta Adresin (Senin mail): " GONDEREN_MAIL
read -p "Karşıda Görünecek İsim (Örn: Google Security): " GONDEREN_ISIM
read -p "Alıcı E-posta Adresi (Kime?): " ALICI
read -p "Konu Başlığı: " KONU
read -p "Mesaj İçeriği: " MESAJ
read -p "Gmail Uygulama Şifren (16 hane): " SIFRE

echo ""
echo "[-] Mail gönderiliyor, lütfen bekle..."

# sendEmail komutunu dinamik girdilerle çalıştıralım
sendEmail -f "$GONDEREN_ISIM <$GONDEREN_MAIL>" \
          -t "$ALICI" \
          -u "$KONU" \
          -m "$MESAJ" \
          -s smtp.gmail.com:587 \
          -xu "$GONDEREN_MAIL" \
          -xp "$SIFRE" \
          -o tls=yes

echo ""
echo "[+] İşlem tamamlandı! Kontrol edebilirsin."

