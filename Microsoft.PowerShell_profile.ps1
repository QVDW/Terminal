function dement {
    Write-Host "                            "
    Write-Host "                                             " -ForegroundColor black -BackgroundColor cyan
    Write-Host "    qclone - Clone & Build project           " -ForegroundColor black -BackgroundColor cyan
    Write-Host "    qproject - Go to existing project        " -ForegroundColor black -BackgroundColor cyan
    Write-Host "    qbranch - Create a new branch            " -ForegroundColor black -BackgroundColor cyan
    Write-Host "    qswitch - Switch to a existing branch    " -ForegroundColor black -BackgroundColor cyan
    Write-Host "    qcommit - Commit and push changes        " -ForegroundColor black -BackgroundColor cyan
    Write-Host "    qlist - A list of extra commands         " -ForegroundColor black -BackgroundColor cyan
    Write-Host "                                             " -ForegroundColor black -BackgroundColor cyan
    Write-Host "                            "
}

function qlist{
    Write-Host "    whodis -  Did u forget someones name?    " -ForegroundColor black -BackgroundColor cyan
    Write-Host "    wya - Shows full path of current location    " -ForegroundColor black -BackgroundColor cyan
}

function qclone{
    www
    Write-Host "####################################"-ForegroundColor green
    $ProjectLink = Read-Host "Enter your github clone link"
    $ProjectNaam = Read-Host "What name would you like this project to have? (No spaces)"
    $DatabaseAnswer = Read-Host "Did you create/have a (new) database you can connect? y/n (Default: n)"
    if ($DatabaseAnswer -eq "y"){
        git clone $ProjectLink $ProjectNaam
        cd $ProjectNaam
        composer update
    } 
    else{ 
        
        Write-Host "                            "
        Write-Host "                            " -BackgroundColor red
        Write-Host "  Create a database first!  " -ForegroundColor white -BackgroundColor red
        Write-Host "                            " -BackgroundColor red
        Write-Host "                            "
        break
    }
    php artisan install
    $ProjectBranchQ = Read-Host "Do you want to work on a new branch or a existing branch? (Default: existing)"
    if ($ProjectBranchQ -eq "new"){
        qbranch
    } 
    else{
        qswitch
    }

    Write-Host "vergeet de .local niet toetevoegen in de domains van de database" -ForegroundColor red
}

function qbranch{
    $ProjectBranchNew = Read-Host "What would you like to call your new branch?"
    git switch -c $ProjectBranchNew
}

function qswitch{
    allBranch
    $ProjectBranchExisting = Read-Host "To which branch would you like to switch?"
    git switch $ProjectBranchExisting
    $PullQ = Read-Host "Would you like to pull from this branch? y/n (Default: n)"
    if ($PullQ -eq "y"){
        gpull
    } 
    else{
        break
    }
}

function qcommit{
    $BranchCommitSwitch = Read-Host "do you want to move to another branch? (Default: n)"
    if ($BranchCommitSwitch -eq "y"){
        allBranch
        $CommitSwitch = Read-Host "To what branch would you like to commit?"
        git switch $CommitSwitch  
    }   
    $CommitMSG = Read-Host "Write a commit message"
    git commit -am $CommitMSG
    git push
}

function whodis{
    Write-Host "   Vincent van Wijk" -ForegroundColor black -BackgroundColor green
    Write-Host "   William Klerk" -ForegroundColor black -BackgroundColor green
    Write-Host "   Vincent Kroon" -ForegroundColor black -BackgroundColor green
    Write-Host "   Hans Huisman" -ForegroundColor black -BackgroundColor green
    Write-Host "   Arno Verhoef" -ForegroundColor black -BackgroundColor green
    Write-Host "   Daphne (Redactie stagair)" -ForegroundColor black -BackgroundColor green
    Write-Host "   Esly (Front-End thuis)" -ForegroundColor black -BackgroundColor green
    Write-Host "   Hennie (Goeie gozer)" -ForegroundColor black -BackgroundColor green
    Write-Host "   Josette (Vrouw van Hans)" -ForegroundColor black -BackgroundColor green
    Write-Host "   Pepijn (Redactie stagaire)" -ForegroundColor black -BackgroundColor green
    Write-Host "   Silvester Server Freelancer" -ForegroundColor black -BackgroundColor green
    Write-Host "   Susan (Fullstack Thuis)" -ForegroundColor black -BackgroundColor green
    Write-Host "   Willem (Redactie guy die ik wss nooit ga zien)" -ForegroundColor black -BackgroundColor green
}

function qproject{
    www
    dir
    $ProjectSwitch = Read-Host "What directory would you like to contineu in?"
    cd $ProjectSwitch
    $ProjectBranchQ = Read-Host "Do you want to work on a new branch or a existing branch? (Default: existing)"
    if ($DatabaseAnswer -eq "new"){
        qbranch
    }
    else{
        qswitch
    }
    code .
    npm run dev
}

function wya{
    Write-Host ""
    Write-Host "You are here: " -NoNewline
    Write-Host $pwd -ForegroundColor white
    Write-Host ""
}

function www{
    cd C:\laragon\www
}

function gpull { git pull }
function gpush { git push }
function gstatus { git status }
function gcheck {
    param([String]$branch)
    git checkout $branch
}
function gmerge {
    param($branch)
    git merge $branch
}
function allBranch {
    git branch -a
}
function idgaf {
    git commit -am 'wip' --no-verify; git push
}
# Additional helper functions if used elsewhere
function dev { git checkout dev }
function master { git checkout master }
function createNewBranch {
    param([String]$branch)
    git switch -c $branch
}
Set-Alias nb createNewBranch
function changeBranch {
    param([String]$branch)
    git switch $branch
}
Set-Alias cb changeBranch

function gpull { git pull }

#Terminal opening
oh-my-posh init pwsh --config 'C:\Users\Quinten\AppData\Local\Programs\oh-my-posh\themes\jblab_2021.omp.json' | Invoke-Expression
dement
