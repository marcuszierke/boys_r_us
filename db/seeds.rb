require 'open-uri'
require 'nokogiri'

photos = [
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057757/nezqhtnsaakpqslfmryk.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057752/vywgvwvrvuycyhrnd4os.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057748/l7pprbduniiq4pnqzlhp.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057744/obcant3wg8fo9dxy6uib.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057715/644675.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057685/663654.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057681/663653.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057677/644676.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057653/onuqqhbikgixo7l5hdxq.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057647/fnbeeupaskitsuw3ywgt.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057643/cwvzjtkaqlpfw91os5eb.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057639/kzxe0z1nezymngjlihtl.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057620/530507.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057616/530504.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057613/400910.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057610/fmj2feldgxtaychfqxhx.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057586/okqkltjll99uqfoiuhty.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057582/niphhtjs1tml5ittweiv.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057578/wjdpioywky3nm8sfwmu5.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057574/ojjzmf8pzowdk6awzqsw.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057555/545069.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057551/545068.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057546/545067.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057542/545065.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057522/588318.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057514/wmdzibgobpgxjosygocu.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057509/drceym6wi0gnj3hlm4fc.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057499/sebe0yeym9v79hvolj6n.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057481/rsx8qbidikvtjcjewvgs.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057477/xyewnouvcqtoxzcu31mi.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057474/pxiyoyno4g8hodmqrxlq.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057471/ztdius4qdbidg9h1idec.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057416/436121.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057419/461290.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057423/436142.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057430/436123.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057364/167151.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057367/hwsyshvsi8ci1c9ccscv.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057372/425993.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057380/167129.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057323/658584.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057330/658569.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057334/658543.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057340/659640.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057286/605791.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057289/424643.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057295/ze8qmswcl353s8uqzxu5.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057300/468595.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057263/178245.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057259/208723.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057253/178527.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057249/313335.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057213/613825.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057203/613820.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057198/613812.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057194/613826.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057170/526255.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057163/304373.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057159/524788.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057155/nun6qtque0ergecqosjx.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057132/451354.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057127/445796.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057123/445794.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057120/445799.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057090/539088.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057085/539089.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057076/539087.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057069/127488.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057044/gulhpubappjrvncl9xoi.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057030/iou15ldbweqioyal3z5u.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057025/ho0vlfflykszjnly6izj.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519057021/sybwjdssmxqhzrs8jd6z.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519057003/531241.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056995/66376.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056990/66369.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056986/221477.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056958/zfcvetwrxyneutp11ad8.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056954/609564.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056951/609562.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056947/ydo4innlp9raylq3c9jb.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056923/the7filg9b4v3uhhsphx.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056919/tokvgz7dpfnubztpx5r5.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056905/kcgfq6rtihmg6c27xp3u.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056901/oahh1xr91r7wvg9ped6j.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056872/123382.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056868/521189.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056865/521187.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056861/123387.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056835/648651.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056832/648652.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056828/566394.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056821/495855.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056806/513066.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056802/611455.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056798/611451.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056794/611450.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056772/xyhj7w0xocyaxyl7caqo.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056768/qpkzv8pnpz208kbpoisd.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056765/501379.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056761/501222.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056738/206139.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056731/200527.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056726/352564.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056716/210236.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056691/225614.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056687/39284.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056684/393908.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056680/393904.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056600/575236.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056596/644590.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056592/533999.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056586/644591.png'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056569/352659.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056562/398095.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056551/398102.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056547/352658.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056489/637896.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056485/637904.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056471/mczmnblir4tbpbnrsmlb.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056466/637899.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056416/r0aszwzzlizcsj1pzx5v.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056412/jzq5ls9ivqnzbcn5gwmx.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056408/i0lvb4qjwwg0zi5wc3j4.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056404/t0i6zyxz6r5i0enoigp7.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056374/lbj0aqu3ts0xairp59zv.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056369/tifbedsffbiincbsw65d.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056363/qdghbxzkkva8vj09pex5.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056358/khvyvny0n6cwfsbim0lr.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056294/438753.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056287/iwm7vbcmccl4tlz3ct6d.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056272/641533.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056240/oakf6gpkq5nyikmhl5ax.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056222/q3okx8pggsbkjo2hhosu.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056216/fkgumh2e6njmwsfiklvw.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056211/xntnidzq15xtaroh9zuw.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056205/ntwk58xildkrg1adyxzf.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056138/651788.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056129/651793.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056122/651797.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056117/651802.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056098/639234.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056093/639235.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056087/543131.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056075/543134.png'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519056033/526372.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056030/526371.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056019/571485.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519056015/571480.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055980/rmgvethps6ojzy3sg8tu.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055968/lybotwan8cswtkeosdpi.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055965/xj1f1nnasibjzvxnn0ny.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055960/sizofldwupqfccv6qfj3.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055943/sf28j9i0mtqjjr9naje4.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055937/nrzy7yhzusw0rjo4s7yv.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055931/bbehkcvjl5mtzbvfliaf.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055927/t3buybjts8j9oy2k7suk.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055864/642608.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055841/523136.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055837/533789.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055831/501328.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055800/mvtxo7dnf7oiollfuzmy.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055796/lbmcbxvbpfxiumbqg0ya.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055789/cdylfx1z7tdovecmg2e0.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055779/639470.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055760/588286.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055755/588275.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055748/oxyfc46zc41nfqakbnpz.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055744/sb9l2mcydtswmwdkmif4.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055723/40256.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055717/250972.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055712/216546.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055708/85029.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055685/390665.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055675/hggfplielpcgzvnq9nvk.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055670/390676.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055661/suayxdhe7wizvlfvipwi.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519055462/668193.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055451/kerir11xlizofnoyr6n9.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055443/668189.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519055433/577534.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519052346/q3cdd3izjbhx5fdfwum5.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052335/svmmssu1plfxdfaybjb3.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052327/o415dat8foffykmt1x0i.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052319/mv11hahvyo2qj4h3zgej.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519052294/649743.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052286/649741.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052281/649738.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052271/649737.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519052034/pygs9akxr8by4b7iffop.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052019/bhgjijonrjtnmhomdrtc.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519052006/ixo2yyhbw9vchotlmvec.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519051997/hq22b2szypvoxjhrysbs.png'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519051740/481954.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519051734/481949.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519051726/481955.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519051720/481951.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519050380/078.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050370/Menswear-LR-8-1000x1359.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050366/image006.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050362/00018-1000x1310.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519050333/SERDAR-KAYABALI-112-1000x1333.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050324/SERDAR-KAYABALI-UPM17004-1000x1406.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050318/SERDAR-KAYABALI-144-1000x1333.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050313/SERDAR-KAYABALI-137-1000x1333.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519050276/philippe-reynaud26.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050260/philippe-reynaud21.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050255/philippe-reynaud36.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050250/philippe-reynaud20.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519050189/Test_Markus047.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050181/marcus-zierke11-1000x1333.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050175/marcus-zierke9-1000x1333.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050162/Test_Markus022.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519050091/Corey-Baptiste-SLIMI-4_URIVALDO_REWIND10_crop-1000x1333.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050080/COREY-Neiman_Marcus_April_2016_Book_by_Alistair_Taylor-Young-2.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050071/Corey-Baptiste-SLIMI-4_URIVALDO_REWIND7_1-1000x1333.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050068/Corey-Baptiste-SLIMI-4_URIVALDO_REWIND3-1000x1333.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519050004/1-71.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049998/1-721.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049993/ALIM-K-UPM16.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049981/1-29.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519049892/Screen_Shot_2018-02-19_at_15.17.58.png', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049828/20170922_05295665_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049822/20170922_05175028_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049818/20171018_155843943_M.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519049666/20171013_094134445_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049660/20171013_094200777_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049653/20171013_094125146_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519049650/20171013_094119387_M.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519050682/1510135735poraloid_2017110718.37.23.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050677/1515722768poraloid_tumblr_p25a9yUuKg1qclgtmo5_1280.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050673/1510135969poraloid_201609021040530001.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519050669/1511520839poraloid_201609021042080001.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519048876/20170901_01303212_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048865/20170901_01294317_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048858/20170901_01292539_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048853/20170901_01291631_M.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519048794/20170902_17412401_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048785/20170902_17390277_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048780/20170902_17403735_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048774/20170902_17392294_M.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519048701/20170918_17391645_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048692/20171013_143017452_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048678/20171013_145426929_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048667/20170918_17402484_M.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519048607/20170831_22502087_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048600/20170831_22494954_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048594/20170831_22493945_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048584/20170831_22492972_M.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519048508/20170928_150208165_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048503/20171022_211949257_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048497/20171022_212553799_M.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519048491/20171122_094843384_M.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519047879/FredG011.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047870/FredG004-1102x1600.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047854/FredG015-1066x1600.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047829/FredG007-1023x1600.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519047762/MattG026.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047726/MattG001.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047707/MattG006.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047698/MattG020-1318x1600.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519047638/AlexG010.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047620/AlexG023-1066x1600.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047603/AlexG008.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047589/AlexG005-1142x1600.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519047342/2955t23.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047328/2955t1.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047328/2955t1.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047325/2955t0.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519047058/main_w250_33213c1da8.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047051/main_w250_8ecbaefb9b.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047047/main_w250_0ccf7bc5f6.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047040/main_banner_e50724da87.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519047010/main_w250_9c456df6db.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519047002/main_w250_8ebd529e56.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046998/main_w250_a9db6858c7.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046993/main_w250_5902004401.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519046940/main_w250_9c936fa0a3.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046927/main_w250_65136ac2d3.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046918/main_w250_0c025d261f.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046916/main_w250_8c00584651.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519046860/main_w250_1c7571856a.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046845/main_w250_9361f1dfd5.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046824/main_w250_9f725284a4.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046816/main_w250_fb6e15e018.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519046785/main_w250_e8c4b54864.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046777/main_w250_bd030bd053.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046768/main_w250_9ab6a79c50.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046765/main_w250_64fae4df87.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519046723/main_w250_bc9e952d55.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046716/main_w250_cf129cb747.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046702/main_w250_f10b65aff2.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046700/main_w250_e81ff1ba5a.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519046668/main_w250_90d6dfa6bb.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046649/main_w250_6d023506ae.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046639/main_w250_7edab984d1.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046629/main_w250_8c63084251.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519046509/main_w250_6d71ebfb81.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046502/main_w250_13da23e06c.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046497/main_w250_d5f7dc8a2c.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046492/main_w250_5189d03de6.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519046461/main_w250_fb703931a9.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046452/main_w250_db09a1ad65.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046439/main_w250_e2a50eb7ba.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519046439/main_w250_e2a50eb7ba.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519042321/main_w250_f2803bcf1b.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519042316/main_w250_1a8e33ce9e.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519042311/main_w250_20ee372465.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519042301/main_banner_b06b5cfa3e.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041847/175_t_91a9e293-e65d-4639-9a4f-9554430ce405.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041844/175_t_017904f5-1d0a-4099-9773-3426c1ae853c.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041826/175_t_1275cf40-fa50-494a-b4fc-a7085bf3ed74.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041823/175_t_a98baab0-9ccc-41aa-bbdf-a1e02cab27e9.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041766/6922_t_48af55c2-9f14-425e-91e7-42484f9bf1a7.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041756/6922_t_6f8f004c-b057-4840-bf78-65737809dae3.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041748/6922_t_06140998-02c8-4dfa-8a97-2c31601416ab.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041741/6922_t_d67bad8f-9c85-44ca-ad21-6d773e4ea97a.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041708/3780_t_abb284ef-2aef-4294-9938-7d461be04a5e.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041704/3780_t_95f3c2e9-52d4-451d-9249-1d6b1723a07a.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041698/3780_t_86778fad-c659-4e07-93ee-990f87b0b0db.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041693/3780_t_d0c12b3c-bca5-4e0b-8e92-7aa4ecb0220e.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041624/740_t_b799f44c-0716-4ce2-bc26-126a36a7ee7f.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041618/740_t_2436fbad-b28b-4f25-b446-e698ddbce756.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041609/740_t_fb19a8c3-e06f-4bfa-9ae5-db0ca143aa26.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041599/740_t_c5b87ac9-ef77-48f3-8e61-6c198934fa60.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041553/208_t_fb2d1c3b-0ce2-4610-81e3-c675a6f38896.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041549/208_t_dc57c6b3-f7a5-43ff-9700-d88adddce1df.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041537/208_t_3fda998b-4ff9-43bd-99f9-0d332e9420f2.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041534/208_t_98c143f4-16c5-446f-96ff-06557c9ab737.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041476/kult_model_Zac_Yonekawa_36935.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041471/kult_model_Zac_Yonekawa_36933.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041464/kult_model_Zac_Yonekawa_36920.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041458/kult_model_Zac_Yonekawa_36913.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041372/kult_model_Wonil_119763.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041366/kult_model_Wonil_119779.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041361/kult_model_Wonil_119778.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041351/kult_model_Wonil_119753.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041287/kult_model_Shawn_Golomingi_138509.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041281/kult_model_Shawn_Golomingi_138507.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041274/kult_model_Shawn_Golomingi_138498.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041269/kult_model_Shawn_Golomingi_138492.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041209/kult_model_Ryan_Tift_84616.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041152/kult_model_Ryan_Tift_84609.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041142/kult_model_Ryan_Tift_84599.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041137/kult_model_Ryan_Tift_84593.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519041081/kult_model_Peter_Argue_120690.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041079/kult_model_Peter_Argue_120688.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041074/kult_model_Peter_Argue_120687.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519041070/kult_model_Peter_Argue_120683.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040780/kult_model_Kamui_128427.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040773/kult_model_Kamui_128438.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040760/kult_model_Kamui_128412.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040752/kult_model_Kamui_128411.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040705/kult_model_Ingo_Brosch_144244.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040687/kult_model_Ingo_Brosch_144227.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040678/kult_model_Ingo_Brosch_144228.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040666/kult_model_Ingo_Brosch_144220.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040604/kult_model_Efosa_108241.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040592/kult_model_Efosa_108222.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040578/kult_model_Efosa_108207.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040561/kult_model_Efosa_108197.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040520/kult_model_Edu_Roman_143559.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040499/kult_model_Edu_Roman_143543.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040487/kult_model_Edu_Roman_143540.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040475/kult_model_Edu_Roman_143526.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040447/kult_model_Devran_Taskesen_144285.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040441/kult_model_Devran_Taskesen_144276.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040432/kult_model_Devran_Taskesen_144260.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040428/kult_model_Devran_Taskesen_144259.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040384/kult_model_Dave_Gordon_140394.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040376/kult_model_Dave_Gordon_140384.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040367/kult_model_Dave_Gordon_140376.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040359/kult_model_Dave_Gordon_140370.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040307/kult_model_Brandon_Lewis_32273.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040291/kult_model_Brandon_Lewis_32260.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040274/kult_model_Brandon_Lewis_32254.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040269/kult_model_Brandon_Lewis_32276.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040204/kult_model_Anton_Nilsson_88677.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040194/kult_model_Anton_Nilsson_88665.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040187/kult_model_Anton_Nilsson_88668.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040182/kult_model_Anton_Nilsson_88664.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040138/kult_model_Adam_L_98856.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040131/kult_model_Adam_L_98845.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040114/kult_model_Adam_L_98837.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040103/kult_model_Adam_L_98834.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519040024/kult_model_Maxwell_Odero_134206.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519040011/kult_model_Maxwell_Odero_132345.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039999/kult_model_Maxwell_Odero_132343.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039988/kult_model_Maxwell_Odero_132337.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519039910/kult_model_Zandre_Du_Plessis_144051.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039889/kult_model_Zandre_Du_Plessis_144046.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039875/kult_model_Zandre_Du_Plessis_144034.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039865/kult_model_Zandre_Du_Plessis_144028.jpg'],
  ['http://res.cloudinary.com/dncveixad/image/upload/v1519039757/kult_model_Julian_Weigl_145265.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039746/kult_model_Julian_Weigl_147117.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039742/kult_model_Julian_Weigl_145263.jpg', 'http://res.cloudinary.com/dncveixad/image/upload/v1519039736/kult_model_Julian_Weigl_145262.jpg']
]

c = 1

url = open('https://www.ocf.berkeley.edu/~montymex/pickup/cheesy.html').read
html_file = Nokogiri::HTML(url)

quotes = []
html_file.search('td').each do |item|
  quotes << item.text.strip
end

selection = quotes.each_slice(3).map(&:first)

selection = selection[1..-1]


Stripper.destroy_all

50.times do
  characters = %w(policeman firefighter delivery motz soldier prof cowboy worker santa cab waiter bowling)
  arr = []
  rounds = (5..12).to_a.sample
  arr << characters.sample(rounds)
  characters = arr.join(" ")
  name = Faker::Superhero.name
  description = "#{selection[c]}*#{Faker::Lorem.paragraph(10)}"
  price = (55..294).to_a.sample
  review = (0..50).to_a.sample.to_f / 10
  ethnicity = %w(oceanic caucasian black asian latino).sample
  city = %w(Berlin Barcelona Hamburg Sydney London Paris Madrid Cologne Frankfurt Rio).sample
  height = (165..203).to_a.sample
  hair_color = ['brown', 'black', 'blond', 'white', 'light-brown', 'dark-brown', 'dark-blond', 'ginger'].sample
  eye_color = %W(green blue green-grey blue-grey hazel brown).sample
  age = (18..65).to_a.sample
  email = Faker::Internet.email
  photo_urls = photos[c]
  pics1 = photo_urls[0]
  pics2 = photo_urls[1]
  pics3 = photo_urls[2]
  pics4 = photo_urls[3]
  Stripper.create(password: "password", email: email, characters: characters, ethnicity: ethnicity, name: name, price: price, review: review, description: description, city: city, height: height, hair_color: hair_color, eye_color: eye_color, age: age, pics1: pics1, pics2: pics2, pics3: pics3, pics4: pics4)
  p "worked, number #{c}"
  c += 1;
end

p1 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519039757/kult_model_Julian_Weigl_145265.jpg'
p2 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519039757/kult_model_Julian_Weigl_145265.jpg'
p3 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519039757/kult_model_Julian_Weigl_145265.jpg'
p4 = 'http://res.cloudinary.com/dncveixad/image/upload/v1519039757/kult_model_Julian_Weigl_145265.jpg'

Stripper.create(password: "password", email: "tuan@lewagon.com", name: "The Penetrator",
  ethnicity: "oceanic", characters: "motz prof cowboy santa cab waiter bowling",price: 69, review: 5,
  description: "Do you believe in love at first sight or shall I walk by again?*I translate ethnic slurs for Cuban refugees. I woo women with my sensuous and godlike bagpipe playing. I am a veteran in love, and an outlaw in Peru. Using only a hoe and a large glass of water, I once single-handedly defended a small village in the Amazon Basin from a horde of ferocious army ants. I know the exact location of every food item in the supermarket. I have performed several covert operations for the CIA. I sleep once a week; when I do sleep, I sleep in a chair. While on vacation in Canada, I successfully negotiated with a group of terrorists who had seized a small bakery. The laws of physics do not apply to me. I have played Hamlet, I have performed open-heart surgery and I have been Mandelas consultant. Do you really need any more reasons?", city: "Bangcock", height: 181, hair_color: "dark-brown",
  eye_color: "brown", age: 48, pics1: p1, pics2: p2, pics3: p3, pics4: p4)



