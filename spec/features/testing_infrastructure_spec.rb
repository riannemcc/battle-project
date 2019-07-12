feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Welcome to Battle. Your death awaits'
  end
end

feature 'play button' do
  scenario 'play button re-directs you to player naming page' do
    visit('/')
    click_button 'Play!'
    expect(page).to have_content 'Enter Player Names'
  end
end

feature 'Entering players' do
  scenario 'allows to enter names and be greeted on the following page' do
    sign_in_and_play
    expect(page).to have_content 'Richie vs. Charlie'
  end

  feature 'See Player 2 hit points' do
    scenario 'it allows Player 1 to see Player 2`s hit points' do
      sign_in_and_play
      expect(page).to have_content 'Charlie 100 HP'
    end
  end

  feature 'Attack Player 2' do
    scenario 'it allows me to attack Player 2 and get confirmation' do
      sign_in_and_play
      click_button 'Karate Chopskies'
      expect(page).to have_content "Richie Karate Chopskied Charlie"
    end
  end

  feature 'Reduce players HP after attack' do
    scenario 'attack player 2' do
      sign_in_and_play
      click_button 'Karate Chopskies'
      expect(page).to have_content "Charlie HP: 85"
      expect(page).to_not have_content "Charlie HP: 100"
    end
  end

  feature 'Switch player turns' do
    context 'seeing whose turn it is' do
      scenario 'switch turn from player one to player two' do
        sign_in_and_play
        expect(page).to have_content "Richie's turn"
      end

      scenario 'after player one attacks' do
        sign_in_and_play
        click_button 'Karate Chopskies'
        expect(page).not_to have_content "Richie's turn"
        expect(page).to have_content "Charlie's turn"
      end
    end
  end
end
