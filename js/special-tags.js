function feedSpecialTags() {
    let tags = ['concept', 'warning', 'trap'];

    for (let tag of tags) {
        let specialElms = document.getElementsByTagName(`${tag}`);

        for (let elm of specialElms) {
            let specialTag = document.createElement(`${tag}tag`);
            specialTag.innerHTML = `<title>${elm.title}</title>`;
            elm.parentNode.insertBefore(specialTag, elm);
        }
    }
}

document.addEventListener('DOMContentLoaded', feedSpecialTags);
