# :cherry_blossom:README

## :house_with_garden:アプリ名
### まもるくん

## :globe_with_meridians: URL
http://54.168.35.244

## :computer:開発環境
- Rails 5.2.4.4　　
- ruby 2.5.1　　
- Haml　　
- SCSS　　
- capistrano 3.14.1　　
- unicorn 5.7.0　　
- nginx　　
- AWS (EC2)　　

## :art:デザイン
![localhost_3000_strangers(iPad)](https://user-images.githubusercontent.com/62837444/99184098-005a0d00-2784-11eb-8b3e-ca6fb844a163.png)　　

## :key:制作背景
女性の一人暮らし、お子さんのお留守番が不安・・・。  
男性が一緒にいてくれたらいいのに。  

男性の声でインターホンに対応することができれば相手に男性がいると思わせることができ、防犯に繋がるのではないかと考えました。  
女性やお子さんが一人で家にいても安心できることを目的として制作したアプリケーションです。  　　

## :beginner:使い方
左側のメニューから「宅配業者用」、「知らない人用」を選びます。  
お手持ちのPC、スマートフォンのスピーカーをインターホンのマイクに近づけてください。  
適した音声を選び、再生ボタンを押してください。  
男性の声であなたの代わりにインターホン越しに対応します。    　　

## :bulb:工夫したポイント
このアプリの用途上、すぐに利用することができる、見やすい、ということをを意識して以下の部分を工夫しました。
- 機能を分かりやすく、シンプルにしていいます
- 利用にログインが不要です
- インターホンの利用で警戒するべきだと思われる「配送業社を名乗る人」「全く知らない人」の２パターンに分けて音声を用意しています
- 音声は予想される会話の流れに沿って上から並べています

## :black_nib:このアプリケーションの今後について
本アプリケーションはインターホンが鳴った際にすぐ利用できるよう、できる限りシンプルな作りを意識しています。  
その為、現在は単純な音声再生のみとなっております。  
今後使いやすくするために以下を予定しています。    

- ログイン機能の追加
- ユーザー同士の不審者情報や防犯に関する情報交換用ページの追加
- お問い合わせページの追加
- 利便性を高めるためにSwiftにてスマホアプリ化

更に便利に利用できる機能があればアップデートしていきたいと考えております。　　　　


## :seedling:DB設計
### audiosテーブル
|Column|Type|Options|
|------|----|-------|
|voice|string||


## :sparkles:Special thanks!!
音声の提供をしていただきました  
ジュン  
Twitter @JUN_WEB_FREE
