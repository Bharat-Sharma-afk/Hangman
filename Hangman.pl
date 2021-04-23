#!/usr/local/bin/perl

@list_of_words =    (computer,radio,calculator,teacher,bureau,police,geometry,president,subject,country,enviroment,classroom,
                    animals,province,month,politics,puzzle,instrument,kitchen,language,vampire,ghost,solution,service,software,
                    virus25,security,phonenumber,expert,website,agreement,support,compatibility,advanced,search,triathlon,
                    immediately,encyclopedia,endurance,distance,nature,history,organization,international,championship,government,
                    popularity,thousand,feature,wetsuit,fitness,legendary,variation,equal,approximately,segment,priority,physics,
                    branche,science,mathematics,lightning,dispersion,accelerator,detector,terminology,design,operation,foundation,
                    application,prediction,reference,measurement,concept,perspective,overview,position,airplane,symmetry,dimension,
                    toxic,algebra,illustration,classic,verification,citation,unusual,resource,analysis,license,comedy,screenplay,
                    production,release,emphasis,director,trademark,vehicle,aircraft,experiment);

$game=1;
while($game!=0)
{
    print "                              ________\n";
    print "                              |   |\n";
    print "             |   |  /\\  |\\  | |   O     |\\    /|  /\\  |\\  |\n";
    print "             |---| /--\\ | \\ | |  /|\\    | \\  / | /--\\ | \\ |\n";
    print "             |   |/    \\|  \\| |  / \\ __ |  \\/  |/    \\|  \\|\n";
    print "                              |_______|\n";
    print "                                                    Version: 1.1.0\n";
    print "                                                    Developer: Bharat Sharma\n";
    print "________________________________________________________________________________\n\n";

    $random=int(rand(100));
    $secret_word=$list_of_words[$random];
    $size= length $list_of_words[$random]; 
    @hidden=("_") x $size;
    @secret_word_array = split('',$secret_word);
    @guessed=();


    print "$secret_word\n";
    $wrong_guesses = 0;
    while($wrong_guesses < 6)
    {
        $chances_remaining=6-$wrong_guesses;
        show_hangman($wrong_guesses);
        print "\nWord: @hidden\n";
        print "Chances Remaining: $chances_remaining\n";
        print "Guesses so Far: @guessed\n";
        $guess= Input(@guessed);
        print "___________________________\n\n";
        push @guessed,$guess;
        $guess_correct_or_not=0;
        
        for ($i=0; $i< $size; $i++)
        {
            if($secret_word_array[$i] eq $guess)
            {
                $hidden[$i] = $guess;
                $guess_correct_or_not = 1;
            }
        }
        if($guess_correct_or_not==0)
        {
            $wrong_guesses++;
        }
        
        $temp=1;
        for ($k=0; $k< $#hidden+1; $k++)
        {
            if(!($hidden[$k] eq $secret_word_array[$k]))
            {
                $temp = 0;
            }
        }

        if($guess eq $secret_word)
        {
            print "Secret Word: $secret_word\n";
            show_hangman(8);
            $wrong_guesses=6;
        }
        elsif($temp==1)
        {
            print "Secret Word: $secret_word\n";
            show_hangman(8);
            $wrong_guesses=6;
        }
        elsif($wrong_guesses==6)
        {
            print "Secret Word: $secret_word\n";
            show_hangman(6);
        }
    }
    print "Wanna Play Again?(Y/N): ";
    $response=<STDIN>;
    if($response eq "Y\n" || $response eq "YES\n" || $response eq "y\n" || $response eq "Yes\n" || $response eq "yes\n")
    {
        $game=1;
    }
    else
    {
        $game=0;
    }
}

sub Input
{
    (@guessed)=@_;
    print "Guess a Word: ";
    $guess = <STDIN>;
    $guess = lc $guess;
    chomp $guess;
    print "\n";
    for ($j=0; $j< $#guessed+1; $j++)
    {
        if($guessed[$j] eq $guess)
        {
            print "This Character is Already Guessed!\n";
            return Input(@guessed);
        }
    }
    return $guess;
}

sub show_hangman
{
    ($stage)=@_;

    if($stage==0)
    {
        print "      ______\n";
        print "           |\n";
        print "           |\n";
        print "           |\n";
        print "           |\n";
        print "    _______|\n";
    }
    elsif($stage==1)
    {
        print "      ______\n";
        print "      |    |\n";
        print "      O    |\n";
        print "           |\n";
        print "           |\n";
        print "    _______|\n";
    }
    elsif($stage==2)
    {
        print "      ______\n";
        print "      |    |\n";
        print "      O    |\n";
        print "      |    |\n";
        print "           |\n";
        print "    _______|\n";
    }
    elsif($stage==3)
    {
        print "      ______\n";
        print "      |    |\n";
        print "     \\O    |\n";
        print "      |    |\n";
        print "           |\n";
        print "    _______|\n";
    }
    elsif($stage==4)
    {
        print "      ______\n";
        print "      |    |\n";
        print "     \\O/   |\n";
        print "      |    |\n";
        print "           |\n";
        print "    _______|\n";
    }
    elsif($stage==5)
    {
        print "      ______\n";
        print "      |    |\n";
        print "     \\O/   |\n";
        print "      |    |\n";
        print "     /     |\n";
        print "    _______|\n";
    }
    elsif($stage==6)
    {
        print "      ______\n";
        print "      |    |\n";
        print "     \\O/   |\n";
        print "      |    |\n";
        print "     / \\   |\n";
        print "    _______|\n";

        print " ______________________      _\n";
        print "|  You Killed me Bruh  |     O\n";        
        print "|  Save Me Next Time   |    /|\\\n";
        print "------------------------     \\\ \n";  
    }
    else
    {
        print " ______________________\n";
        print "| Buddy You are Genius |     O/  \n";       
        print "| Thanks For Saving Me |    /| \n";
        print "------------------------    / \\ \n";
    }
}

