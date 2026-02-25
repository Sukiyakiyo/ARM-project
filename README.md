(此為修習組合語言與嵌入式系統時之課堂期中、期末作業，故部分程式碼由教授提供。)

# 程式說明
  name：印出組別與組員的英文姓名。  

  id：輸入3組學號並將3組學號加總，輸入p即印出完整的組員學號與學號總和。  

  drawJuliaSet：計算並決定Frame二維陣列裡元素的值，並以此決定該元素投影至畫面上的Pixel顏色。
  
  main：呼叫前3個函式，分別達成3個函式的功能。  
# 設計重點說明
  name：規劃4個記憶體區塊並分別放入組別與組員英文名。  
  
  id：規劃4個記憶體區塊，讀入3組學號並分別放入，確認最後指令輸入為p後，才會印出學號並將學號加總值放入第4個記憶區塊。  
  
  drawJuliaSet：規劃記憶體空間放入Cx、Cy以及frame，用三個迴圈來計算並設置畫面上各座標的顏色。  
  
  main：應用前3個函式所記錄的資料，輸出組別、組員學號、學號對應的姓名及學號總和後輸入指令p，即以迴圈執行drawJuliaSet函式並印出動畫。  
  
# 程式驗證結果
## drawJuliaSet五張動畫
<img width="627" height="364" alt="image" src="https://github.com/user-attachments/assets/14a8c29d-ace5-4fec-bad9-9b1da140f882" />
<img width="622" height="357" alt="image" src="https://github.com/user-attachments/assets/d9eae0fb-05b2-40e2-8036-d0cb1c129805" />
<img width="621" height="357" alt="image" src="https://github.com/user-attachments/assets/daf73c05-c904-43a3-bc04-9ae98f4dcf74" />
<img width="622" height="357" alt="image" src="https://github.com/user-attachments/assets/ec28395e-5df4-40f5-bc9b-a94e4a5e6c4a" />
<img width="621" height="358" alt="image" src="https://github.com/user-attachments/assets/00358ba5-9261-4586-93d3-dc35f949375f" />
