"use strict";

async function getDust(informCode) {
    const response = await axios.get(`/green/api/air/${informCode}`);
    return response.data.items;
}

function displayItems(items) { // JSON을 HTML에 표시

    const tbody = document.getElementById("tbody");
    for (const item of items) {
        const tr = document.createElement("tr");
        tbody.append(tr);
        item.imageUrls.forEach(url => {
            const td = document.createElement("td");
            const img = document.createElement("img");
            img.src = url;
            td.append(img);
            tr.append(td);
        });
    }

}

getDust("pm10").then(displayItems);