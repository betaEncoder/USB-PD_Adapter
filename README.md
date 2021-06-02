# USB-PD_Adapter PDA-01
-PDから電圧ぶっこ抜く-

**NRND;Not Recomended for New Design**
後継モデルは[PDA-02](https://github.com/betaEncoder/USB-PD_Adapter-PDA-02)です

![USB-PD_Adapter](img/pd_adapter.JPG) 

## これは何？
Mac book や ニンテンドーSwitch などの USB Type-C Power Derivery 対応のACアダプタやモバイルバッテリーのようなPDソース機器からPDOに従った任意の電源を取り出すためのモジュールです．

工作した機器の電源として市販のPD対応モバイルバッテリー等を使うことができるので安全に大容量のエネルギーを活用することができます．

USB 2.0 の信号線も取り出すことができるので，既存のUSB機器などを簡単にPD対応させることができます．

鉛フリー，RoHS対応部品を使用しています．

## USB-PDとは？
これまでUSBホスト機器やACアダプタから提供されるバスパワー電圧は5Vを基本に，電流は最大でも2.1A程度でした．

これが USB PD の仕様上は20V5Aまで(本機では20V3Aまで利用可能です)拡張されました．ただし，ケーブルを繋いだだけで得られるのは5Vまでであり，それを超える電圧を得るためには PD のために設けられた CC の通信線を用いてソース機器と通信を行う必要があります．

また，従来のモバイルバッテリーではスマートフォンなどを充電完了した際に自動的に出力をオフにする機能があるため，消費電流の小さな負荷を接続した際に意図せず出力をオフにされてしまう問題がありました．USB PD 対応出力のあるモバイルバッテリーであればこの問題を回避することができます．


## 注意
全ての USB PD ソース機器との接続や動作を保証するものではありません．

ケーブルを抜き差しする際はコネクタが真直ぐになるように取り扱い，こじらないようにしてください．機械的，電気的に本機を破損する恐れがあります．

USB PD 規格仕様により，VBUSに接続できる容量に制限があり，PDのネゴシエーション後で最大100uFです．大容量の負荷を接続した場合にPDソース機器が過電流保護を働かせる場合があります．その際には負荷側にロードスイッチや電流制限等を設けてください．

また，USB PD ソース機器が対応した電圧のみ取り出すことができます．設定した電圧が必ず取り出せるものではありません．

本機を用いて取り出せる電圧，電流は20V3Aまでです．

本機上には出力電圧や出力電流を制限する仕組みがありません．過負荷等により発熱する恐れがありますので，必ず出力電圧や電流を確認の上使用してください．PDの規格に準拠したソース機器であればPDOに合わせた電流制限などの保護機能があり，ショート等が起こっても安全である筈ですが，負荷に合わせた適切な保護機構を設けることをお勧めします．

電圧設定を誤ると接続先の機器を破損してしまう恐れがあります．よく確認してから電源を投入してください．製品へ組み込む際は利用者の責任において安全対策を行ったうえで管理・使用してください．

検査後に出荷しています．基板の取扱や接続する機器によって容易に破損する可能性があります．取扱には注意してください．

購入時期により画像とは使用部品等が異なる場合があります．

本機を使用したことによるいかなる損害については保証いたしかねます．


## 電圧設定方法
本機上のピンヘッダP1に取り付けるジャンパーによって電圧を設定できます．以下を参照してください．
ソース機器が非対応の電圧は取り出すことができません．

| ジャンパー位置 | 電圧 |
|:--------------|:----|
| ![5V](img/config_5V.JPG)    | 5V  |
| ![9V](img/config_9V.JPG)    | 9V  |
| ![12V](img/config_12V.JPG)  | 12V |
| ![15V](img/config_15V.JPG)  | 15V |
| ![20V](img/config_20V.JPG)  | 20V |
| その他        | 使用しません |

## CN2, CN3 について
電線を直接はんだ付けするほか，日本圧着端子製造(JST)のXHコネクタ又は2.54mmピッチのピンヘッダをはんだ付け可能です．

ハーネスを用いてVBUSとD+,D-を取り出すことができます．

コネクタやハーネスは付属していません．別途ご用意してください．

コネクタを予めはんだ付けされたものや，カスタム品も提供可能です．大量購入などもメール(maruyamaあっとmirai-atelier.com)又はTwitter(@betaEncoder)にてお問い合わせください．

## 基板サイズ(図面)
簡易的な図面と3Dモデルを用意しました．PDFとSTEPファイルがダウンロード可能です．

このデータは寸法を保証するものではありません．参考値としてご利用ください．

[PDF](PD_Adapter.PDF)

[STEP](PD_Adapter.step)

## 動作確認済みPDソース機器

| 製品名 | 出力電圧 | 備考 |
|:--------------|:----|:----|
| Anker Atom PD4       | 5V/9V/15V/20V     | 5A出力可能な製品ですがUSB-PD_Adapterの定格上引き出せる電流は3Aまでとなります |
| Anker PowerPort Atom PD 1 | 5V/9V/15V/20V     |  |
| RAVPower RP-PB159    | 5V/9V/12V/15V/20V |  |
| RAVPower RP-PC104    | 5V/9V/12V/15V/20V |  |
| RAVPower RP-PC112    | 5V/9V/12V/15V/20V |  |
| Xiaomi 65W ACアダプタ | 5V/9V/12V/15V/20V |  |
| SALCAR HDD28-01 | 5V/9V/15V/20V |  |
| Lenovo 45W USB Type-C ウルトラポータブルACアダプター | 5V/9V/15V/20V |  |
