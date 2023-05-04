import credits from './credits-data';

const creditsContainer = document.querySelector('#credits')

for (const person of credits) {
	const containerEl = document.createElement('div')
	const nameEl = document.createElement('span')
	const rolesEl = document.createElement('ul')

	creditsContainer.appendChild(containerEl)
	containerEl.classList.add('person')

	nameEl.innerText = person.name
	containerEl.appendChild(nameEl)

	for (const role of person.roles) {
		const listItem = document.createElement('li')
		listItem.innerText = role;
		rolesEl.appendChild(listItem)
	}

	containerEl.appendChild(rolesEl)

}
