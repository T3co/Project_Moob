IOT robot

using DE10-Lite, ESP32, ESP32-CAM ,LM75(temperature sensor), LED lights and an Android Application as a controller.

programing languages : c++,Java,VHDL

Full Circut Design:

![alt text](https://github.com/T3co/NPC_Mobile/blob/main/fc.png?raw=true)

תהליך הפעלת הפרויקט מתחיל באפליקציה בכל פעולה, דרך האפליקציה המשתמש מקבל נתונים מהשטח ושולח פקודות אל השטח.
בשביל להניע את המנועים אם המשתמש לוחץ על אחד המצבים (קדימה, אחורה, ימין שמאלה) המידע עובר בפרוטוקול WIFI אל שרת הרשת ומשם אל הבקר ESP32, הבקר מקבל את הנתונים שמשמעותם מספר בטווח 0-255. הבקר שולח אותם אל האלטרה בתקן תקשורת RS232, האלטרה מחלקת את 8 הסיביות שהתקבלו לחלקים של מידע שמחולקים להזזת המנועים, קביעת מהירות ודברים אחרים.
 
לאחר פירוק המידע היא שולחת את הסיביות לתוכניות המתאימות לכן בתכנון ההיררכי המורכב בתוך ה – FPGA, ומשם לצרכנים שאותם החלטנו להפעיל במקרה הזה המנועים. 
אם החלטנו על נסיעה קדימה התוכנית המתאימה באלטרה תקבל "0101", ודוחף הזרם- L293D מקבל PWM שתפקידו לקבוע את מהירות המנועים על ידי D.C משתנה בתדר קבוע של 10KHz. ה – L293D מכיל שני גשרי H שתפקידם לספק הספק גבוה למנועים שהבקר אינו יכול לספק, וגם אם כן זה אינו מקובל שהבקר שתפקידו לחשוב יעשה זאת, ללא דוחף הזרם לא היינו יכולים להניע את המנועים. הזרם המתאים עובר דרך גשרי ה – H לכל מנוע יש גשר H ועובר דרך המנועים בכיוון המתאים לכיוון הנסיעה שבחרנו.
 
במידה ונרצה להפעיל את הלייזר, המידע ששלחנו מהאפליקציה בגודל 8 סיביות שמתפרק של חבילות של סיביות עובר לתוכניות המתאימות בתכנון ההיררכי של ה – FPGA וממנו אל ה – uln2803 שתפקידו למשוך זרם ללייזר. האלטרה תספק ללייזר 5v בזרם מאוד נמוך הטרנזיסטור דארלינגטון שבתוכו יכנס לרוויה וזרם יגיע מה – Vcc, יעבור את האנודה אל הקתודה של הלד דרך נגד בגודל Ω275K שתפקידו לווסת את הזרם בצורה נכונה כך שהלד לא יישרף, ויזרום אל האדמה של המעגל. אם האלטרה תיתן 0 וולט הטרנזיסטור יהיה בקטעון ויהיה נתק.

מנוע הסרבו מקבל תדר של 50MHz שבתוכו זמן בגבוה בין 1ms – 2ms לדוגמה כאשר זמן התדר הוא  1.5ms הסרבו יהיה ב - 
90°,  שמשפיע על זווית הסרבו שמשפיע על כיוון הלייזר.

המצלמה נותנת לנו אפשרות לראות כל מקום שיש בוא אינטרנט את מה שיש בשטח שהיא נמצאת בו. אנו מבצעים גם פעולת עיבוד וזיהוי תמונה שתפקידה לאסוף נתונים בשטח ולשלוח אותם למשתמש ובנוסף נותנת אפשרות לרכב להגות אוטומטית כלפי חפץ שנבחר.

LM75 הינו חיישן טמפרטורה שמשדר את טמפרטורת הסביבה של הרכב בעזרת פרוטוקול I2C אל ה – FPGA, התוכנית המתאימה ב – FPGA קולטת את הטמפרטורה שנוגע בפרוטוקול ב – 9 סיביות אחר ב  -  FPGA המידע מומר ל – 8 סיביות. לאחר מכן הטמפרטורה נשלחת בפרנהייט דרך המשדר של האלטרה אל הקולט של ה – ESP32 ומשם שולח את הטמפרטורה אל שרת הרשת בעזרת פרוטוקול WIFI, ומשם אל האפליקציה שם הטמפרטורה מומרת לצלסיוס. תהליך זה בכיוון ההפוך מכיוון שהמידע מגיע מהשטח אל השרת רשת ומשם לאפליקציה ולא ההפך.
Some Of Larry's Best Photos :

![alt text](https://github.com/T3co/NPC_Mobile/blob/main/LWF.jpeg?raw=true)

![alt text](https://github.com/T3co/NPC_Mobile/blob/main/LWS.jpeg?raw=true)
