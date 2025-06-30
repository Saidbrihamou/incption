
let playing = "x"

const player_x = document.getElementById("px")
const player_o = document.getElementById("po")

const color_enb = "#00ff08"
const color_dis = "#E3F0AF"
const color_win = "#1bf7ff"
const color_line_win = "#000000"
player_x.style.backgroundColor =  color_enb;

let game_over = false
const btns = [document.getElementById("btn1") , document.getElementById("btn2"), document.getElementById("btn3") ,
    document.getElementById("btn4") , document.getElementById("btn5") , document.getElementById("btn6") ,
    document.getElementById("btn7"), document.getElementById("btn8") , document.getElementById("btn9")
]

let data = []

for (let i = 0; i < btns.length; i++)
{
    btns[i].addEventListener("click", function(){
        btnclick(i)
    })
    btns[i].innerHTML = ""
    data.push("")
}

function drow_data()
{
    for (let i = 0; i < 9; i++)
    {
         btns[i].innerHTML = data[i]
    }
}

function btnclick(i)
{
    if (btns[i].innerHTML != "" || game_over)
            return 
    if (playing == "x")
    {
        data[i] = "X"
        playing = "o"
        player_o.style.backgroundColor = color_enb;
        player_x.style.backgroundColor = color_dis;
    }
    else
    {
        data[i] = "O"
        playing = "x"
        player_x.style.backgroundColor = color_enb;
        player_o.style.backgroundColor = color_dis;
    }
    drow_data();
    cheack_if_win();
}
function isequal(a,  b ,  c)
{
    return (data[a] == data[b] && data[b] == data[c] && data[c] != "")
}
function cheack_if_win()
{
    if (isequal(0, 1 , 2))
        game_over_win(data[0],0, 1 , 2)
    else if (isequal(3, 4 , 5))
        game_over_win(data[0], 3, 4 , 5)
    else if (isequal(6, 7 , 8))
        game_over_win(data[0], 6, 7 , 8)

    else if (isequal(0, 3 , 6))
        game_over_win(data[0], 0, 3 , 6)
    else if (isequal(1, 4 , 7))
        game_over_win(data[0], 1, 4 , 7)
    else if (isequal(2, 5 , 8))
        game_over_win(data[0], 2, 5 , 8)

    else if (isequal(0, 4 , 8))
        game_over_win(data[0], 0, 4 , 8)
    else if (isequal(2, 4 , 6))
        game_over_win(data[0], 2, 4 , 6)
}

function game_over_win(win, a, b, c)
{
    game_over  = true
    btns[a].style.backgroundColor = color_line_win
    setTimeout(function(){
        btns[b].style.backgroundColor = color_line_win
    }, 400)
    setTimeout(function(){
        btns[c].style.backgroundColor = color_line_win
    }, 800)


    if (win == "X")
    {
        player_x.style.backgroundColor = color_win;
        player_o.style.background = color_dis;
    }
    else
    {
        player_o.style.backgroundColor = color_win;
        player_x.style.background = color_dis;
    }
    // alert(win)
}