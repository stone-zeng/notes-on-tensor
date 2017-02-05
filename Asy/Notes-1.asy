if(!settings.multipleView) settings.batchView=false;
settings.tex="xelatex";
nosetpagesize();
defaultfilename="Notes-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

//***** 导言区设置 *****//
texpreamble("
%\usepackage{suffix}

\usepackage[no-math]{fontspec}
\setmainfont{Source Sans Pro Light}

\usepackage{amsmath}
%\usepackage{amssymb}
%\usepackage{mathtools}

\usepackage{unicode-math}
\setmathfont[
math-style = ISO,
bold-style = ISO
]{xits-math.otf}

\usepackage{xeCJK}
\setCJKmainfont{思源黑体 Light}


\usepackage[svgnames]{xcolor}

%\usepackage{tensor}
%\usepackage{physics}
%\usepackage{siunitx}
");


// 单位 1 = 1cm
unitsize(1cm);

// 默认字号
defaultpen(fontsize(9 pt));

// Mathematica 颜色
//pen color1 = rgb(0.368417, 0.506779, 0.709798);
//pen color2 = rgb(0.880722, 0.611041, 0.142051);
//pen color3 = rgb(0.560181, 0.691569, 0.194885);
//pen color4 = rgb(0.922526, 0.385626, 0.209179);
//pen color5 = rgb(0.647624, 0.378160, 0.614037);
//pen color6 = rgb(0.772079, 0.431554, 0.102387);
//pen color7 = rgb(0.363898, 0.618501, 0.782349);
//pen color8 = rgb(0.972829, 0.621644, 0.073362);


arrowbar myArrow = Arrow(size = 3);

// 椭圆尺寸
real x_radius = 0.6, y_radius = 1.3;
// 椭圆间距
real dist = x_radius + 0.2;
// 边框尺寸
real x_size = x_radius + dist + 0.6;
real y_size1 = y_radius + 0.5;
real y_size2 = y_radius + 0.8;
// 箭头、元素间距
real sep1 = 0.15, sep2 = 0.18;

// 绘制椭圆
pair[] set = {(-4.5,0), (0,0), (4.5,0)};
pair[] set_X, set_Y;
for(int i = 0; i != 3; ++i)
{
set_X.push((set[i].x-dist, set[i].y));
set_Y.push((set[i].x+dist, set[i].y));


draw(ellipse(set_X[i], x_radius, y_radius));
draw(ellipse(set_Y[i], x_radius, y_radius));
}

// 绘制边框
for(int i = 0; i != 3; ++i)
draw((set[i].x-x_size, set[i].y-y_size1)
-- (set[i].x+x_size, set[i].y-y_size1)
-- (set[i].x+x_size, set[i].y+y_size2)
-- (set[i].x-x_size, set[i].y+y_size2) -- cycle,
gray);

// 集合标注
for(int i = 0; i != 3; ++i)
{
label("X", (set_X[i].x, y_radius+0.2));
label("Y", (set_Y[i].x, y_radius+0.2));
}

label("单射，但非满射", (set[0].x, -y_radius-1));
label("满射，但非单射", (set[1].x, -y_radius-1));
label("双射", (set[2].x, -y_radius-1));

// 集合元素
real[] elem3_y = {0.6, 0, -0.6};
real[] elem4_y = {0.81, 0.27, -0.27, -0.81};

// 单射
label("1", (set_X[0].x, elem3_y[0]));
label("2", (set_X[0].x, elem3_y[1]));
label("3", (set_X[0].x, elem3_y[2]));


label("A", (set_Y[0].x, elem4_y[0]));
label("B", (set_Y[0].x, elem4_y[1]));
label("C", (set_Y[0].x, elem4_y[2]));
label("D", (set_Y[0].x, elem4_y[3]));

draw((set_X[0].x+sep1, elem3_y[0])
-- (set_Y[0].x-sep2, elem4_y[0]), myArrow);
draw((set_X[0].x+sep1, elem3_y[1])
-- (set_Y[0].x-sep2, elem4_y[1]), myArrow);
draw((set_X[0].x+sep1, elem3_y[2])
-- (set_Y[0].x-sep2, elem4_y[3]), myArrow);

// 满射
label("1", (set_X[1].x, elem4_y[0]));
label("2", (set_X[1].x, elem4_y[1]));
label("3", (set_X[1].x, elem4_y[2]));
label("4", (set_X[1].x, elem4_y[3]));


label("A", (set_Y[1].x, elem3_y[0]));
label("B", (set_Y[1].x, elem3_y[1]));
label("C", (set_Y[1].x, elem3_y[2]));

draw((set_X[1].x+sep1, elem4_y[0])
-- (set_Y[1].x-sep2, elem3_y[0]), myArrow);
draw((set_X[1].x+sep1, elem4_y[1])
-- (set_Y[1].x-sep2, elem3_y[1]), myArrow);
draw((set_X[1].x+sep1, elem4_y[2])
-- (set_Y[1].x-sep2, elem3_y[2]+0.03), myArrow);
draw((set_X[1].x+sep1, elem4_y[3])
-- (set_Y[1].x-sep2, elem3_y[2]-0.03), myArrow);

// 双射
label("1", (set_X[2].x, elem4_y[0]));
label("2", (set_X[2].x, elem4_y[1]));
label("3", (set_X[2].x, elem4_y[2]));
label("4", (set_X[2].x, elem4_y[3]));

label("A", (set_Y[2].x, elem4_y[0]));
label("B", (set_Y[2].x, elem4_y[1]));
label("C", (set_Y[2].x, elem4_y[2]));
label("D", (set_Y[2].x, elem4_y[3]));

draw((set_X[2].x+sep1, elem4_y[0])
-- (set_Y[2].x-sep2, elem4_y[0]), myArrow);
draw((set_X[2].x+sep1, elem4_y[1])
-- (set_Y[2].x-sep2, elem4_y[1]), myArrow);
draw((set_X[2].x+sep1, elem4_y[2])
-- (set_Y[2].x-sep2, elem4_y[2]), myArrow);
draw((set_X[2].x+sep1, elem4_y[3])
-- (set_Y[2].x-sep2, elem4_y[3]), myArrow);
