module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'

      text = <<-eos
        <script>
          $(document).ready(function() {
            var options = {
              "closeButton": true,
              "debug": false,
              "progressBar": true,
              "positionClass": "toast-bottom-right",
              "onclick": null,
              "showDuration": "400",
              "hideDuration": "1000",
              "timeOut": "7000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
            toastr.#{type}('#{message}', '', options);
          })
        </script>
      eos
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
