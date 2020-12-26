function accountEditForm(displayid) {
    document.getElementById("valueform").value = displayid;
}

function inputformaddlectuer() {
    updateModal = document.getElementById("inserthere");
    const interhtml = `
    <div class="form-group childinput inline">
      
        <label for="lectuerIDW" class="col-form-label">ID Giảng Viên phụ: </label>
      <div class="row">
            <div class="col-lg-10">
                <input class="form-control" type="text" id="lectuerID" name="lectuerIDW" minlength="6" required>
            </div>
            <div class="col-lg-1">
                <button type="button" class="btn btn-link" onclick="removeparentinput(this)">-</button>
            </div>
        </div>
        <label for="numberWeek" class="col-form-label">Số tuần: </label>
        <div class="row">
        <div class="col-lg-10">
                <input class="form-control" type="text" id="numberWeek" name="numberWeek" minlength="1" required>
            </div>
            </div>
    </div>`
    updateModal.insertAdjacentHTML('beforeend', interhtml);
}

function removeinputformaddlectuer() {
    $('.childinput').remove()
}

function removeparentinput(i) {
    i.parentElement.parentElement.parentElement.remove()
}

const medicineTable = $('#medicine-table')
const medicineBody = $('#medicine-body')

const deleteItem = function () {
    $(this).closest('tr').remove()
    const myBody = medicineTable.find('tbody')
    index = 1
    myBody.find('strong').each(function () {
        this.innerHTML = index++
    })
}

medicineTable.on('click', '.delete-item', deleteItem)

$('#add-item').click(function () {
        const myBody = medicineTable.find('tbody')
        const innerHTML = `
  <tr>
      <td><strong>${myBody.find('tr').length + 1}</strong></td>
      <td>
          <div class="control">
              <input class="input" type="text" placeholder="Small input">
          </div>
      </td>
      <td>
          <div class="control">
              <input class="input" type="text" placeholder="Small input">
          </div>
      </td>
      <td>
          <button class="button is-danger is-inverted delete-item">
              <i class="fas fa-minus"></i>
          </button>
      </td>
  </tr>
  `
        const item = jQuery.parseHTML(innerHTML);
        $(item).on('click', '.delete-item', deleteItem)
        myBody.append(item)
        medicineBody.scrollTop(medicineBody.height() + 9999)
    }
)

function submit() {
    let benh_chuan_doan = $('#benh-chuan-doan').val()

}

