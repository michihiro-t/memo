require "csv" 

    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

    memo_type = gets.to_i 

    if memo_type == 1
        puts "拡張子を除いたファイル名を入力してください"
        file_name = gets.chomp + ".csv" 

        puts "メモしたい内容を記入してください"
        puts "完了したらCtrl+Dを押します"

        memo_content = $stdin.read 
        
        CSV.open(file_name ,"w") do |csv|
            csv << [memo_content] 
        end

        puts "メモが保存されました"

    elsif memo_type == 2
        puts "編集するファイル名を入力してください"
        file_name = gets.chomp + ".csv"

        data = CSV.read(file_name, headers: true)
        puts "ファイルの内容を表示します"
        puts data 

        puts "追記したい内容を記入してください"
        puts "完了したらCtrl+Dを押します"

        memo_content = $stdin.read

        CSV.open(file_name, "a") do |csv|
            csv << [memo_content] 
        end

        puts "メモが追記されました"

    else
        puts "1か2を入力してください"
    end