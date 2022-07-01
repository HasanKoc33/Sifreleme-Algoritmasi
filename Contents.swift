import UIKit

var key = "hasan"
var text = "sifrelenecek mesaj"
// şifrelemek istediginiz text in ve key in her harfi bu Stringin içinde olmalı !!!
var kelimeler = "0123456789.,abcçdefgğhıijklmnoöprsştuüvyzABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ "
var harftenIndex = [Character : Int]()
var indexdenharf = [Int : Character]()

for i in stride(from: 0, through: Array(kelimeler).count-1, by:1){
    let char:Character = Array(kelimeler)[i] as Character
    harftenIndex[char] = i
    indexdenharf[i] = char
}

var sifreli : String = ""

for j in stride(from: 0, through: text.count-1, by: 1){
   var offset:Int = harftenIndex[Array(text)[j]]! + harftenIndex[Array(key)[j % key.count]]!
    if(offset != 0)
        {
            sifreli += String(indexdenharf[offset % kelimeler.count]!)
        }
    else
        {
            sifreli += String(indexdenharf[offset]!)
        }

}

print("Şifrelenmiş mesaj : \(sifreli)")


// şifre kırma
var kirilan:String = ""
for j in stride(from: 0, through: sifreli.count-1, by: 1){
   var offset:Int = harftenIndex[Array(sifreli)[j]]! - harftenIndex[Array(key)[j % key.count]]!
    if(offset != 0)
        {
        if(offset>0){
            kirilan += String(indexdenharf[offset % kelimeler.count]!)

        }else {
            kirilan += String(indexdenharf[kelimeler.count + (offset % kelimeler.count)]!)

        }
        }
    else
        {
        kirilan += String(indexdenharf[offset]!)
        }

}
print("Kırılan şifre : \(kirilan)")
