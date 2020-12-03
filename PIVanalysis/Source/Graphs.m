%%
%Extract data
ft1 = load('DataAnalysis\1-1.txt');
ft2 = load('DataAnalysis\2-1.txt');
ft3 = load('DataAnalysis\3-1.txt');
ft4 = load('DataAnalysis\4-1.txt');
ft5 = load('DataAnalysis\5-1.txt');
ft6 = load('DataAnalysis\6-1.txt');
ft7 = load('DataAnalysis\7-1.txt');

%%
[m1, c1]=min(ft1(:,4));
[m2, c2]=min(ft2(:,4));
[m3, c3]=min(ft3(:,4));
[m4, c4]=min(ft4(:,4));
[m5, c5]=min(ft5(:,4));
[m6, c6]=min(ft6(:,4));
[m7, c7]=min(ft7(:,4));

figure(1)
plot(ft1(:,1)-ft1(c1,1),ft1(:,4))
xlabel("Distance on line [m]")
ylabel("Vorticity [1/s]")

figure(2)
plot(ft2(:,1)-ft2(c2,1),ft2(:,4))
xlabel("Distance on line [m]")
ylabel("Vorticity [1/s]")

figure(3)
plot(ft3(:,1)-ft3(c3,1),ft3(:,4))
xlabel("Distance on line [m]")
ylabel("Vorticity [1/s]")

figure(4)
plot(ft4(:,1)-ft4(c4,1),ft4(:,4))
xlabel("Distance on line [m]")
ylabel("Vorticity [1/s]")

figure(5)
plot(ft5(:,1)-ft5(c5,1),ft5(:,4))
xlabel("Distance on line [m]")
ylabel("Vorticity [1/s]")

figure(6)
plot(ft6(:,1)-ft6(c6,1),ft6(:,4))
xlabel("Distance on line [m]")
ylabel("Vorticity [1/s]")

figure(7)
plot(ft7(:,1)-ft7(c7,1),ft7(:,4))
xlabel("Distance on line [m]")
ylabel("Vorticity [1/s]")


mv = [m1 m2 m3 m4 m5 m6 m7];
t = ([100 120 175 275 350 430 530]-100)./100;

figure(8)
plot(t,mv)
xlabel("Time [s]")
ylabel("Vorticity [1/s]")


