<?php $__env->startSection('content'); ?>


<section class="user-dashbord">
  <div class="container">
    <div class="row">
      <?php echo $__env->make('includes.user-dashboard-sidebar', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
      <div class="col-lg-8">
        <div class="user-profile-details">
          <div class="order-history">
            <div class="header-area">
              <h4 class="title">
                <?php echo e($langg->lang378); ?> <a data-toggle="modal" data-target="#vendorform" class="mybtn1"
                  href="javascript:;"> <i class="fas fa-envelope"></i> <?php echo e($langg->lang379); ?></a>
              </h4>
            </div>
            <div class="mr-table allproduct message-area  mt-4">
              <?php echo $__env->make('includes.form-success', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
              <div class="table-responsiv">
                <table id="example" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th><?php echo e($langg->lang380); ?></th>
                      <th><?php echo e($langg->lang381); ?></th>
                      <th><?php echo e($langg->lang382); ?></th>
                      <th><?php echo e($langg->lang383); ?></th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $__currentLoopData = $convs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $conv): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                    <tr class="conv">
                      <input type="hidden" value="<?php echo e($conv->id); ?>">
                      <td><?php echo e($conv->subject); ?></td>
                      <td><?php echo e($conv->message); ?></td>

                      <td><?php echo e($conv->created_at->diffForHumans()); ?></td>
                      <td>
                        <a href="<?php echo e(route('user-message-show',$conv->id)); ?>" class="link view"><i
                            class="fa fa-eye"></i></a>
                        <a href="javascript:;" data-toggle="modal" data-target="#confirm-delete"
                          data-href="<?php echo e(route('user-message-delete1',$conv->id)); ?>" class="link remove"><i
                            class="fa fa-trash"></i></a>
                      </td>

                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<div class="message-modal">
  <div class="modal" id="vendorform" tabindex="-1" role="dialog" aria-labelledby="vendorformLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="vendorformLabel"><?php echo e($langg->lang385); ?></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="container-fluid p-0">
            <div class="row">
              <div class="col-md-12">
                <div class="contact-form">
                  <form id="emailreply1">
                    <?php echo e(csrf_field()); ?>

                    <ul>
                      <li>
                        <input type="text" class="input-field" id="order" name="order_numkber"
                          placeholder="<?php echo e($langg->lang386); ?> *" required="">
                      </li>

                      <li>
                        <input type="text" class="input-field" id="subj1" name="subject"
                          placeholder="<?php echo e($langg->lang387); ?> *" required="">
                      </li>
                      <li>
                        <textarea class="input-field textarea" name="message" id="msg1"
                          placeholder="<?php echo e($langg->lang388); ?> *" required=""></textarea>
                      </li>
                    </ul>
                    <input type="hidden" name="type" value="Dispute">

                    <button class="submit-btn" id="emlsub1" type="submit"><?php echo e($langg->lang389); ?></button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>




<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header d-block text-center">
        <h4 class="modal-title d-inline-block"><?php echo e($langg->lang390); ?></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
        <p class="text-center"><?php echo e($langg->lang392); ?></p>
        <p class="text-center"><?php echo e($langg->lang393); ?></p>
      </div>
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo e($langg->lang394); ?></button>
        <a class="btn btn-danger btn-ok"><?php echo e($langg->lang395); ?></a>
      </div>
    </div>
  </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>

<script type="text/javascript">
  $(document).on("submit", "#emailreply1", function () {
    var token = $(this).find('input[name=_token]').val();
    var subject = $(this).find('input[name=subject]').val();
    var message = $(this).find('textarea[name=message]').val();
    var $type = $(this).find('input[name=type]').val();
    var order = $('#order').val();
    $('#subj1').prop('disabled', true);
    $('#msg1').prop('disabled', true);
    $('#emlsub1').prop('disabled', true);
    $.ajax({
      type: 'post',
      url: "<?php echo e(URL::to('/user/admin/user/send/message')); ?>",
      data: {
        '_token': token,
        'subject': subject,
        'message': message,
        'type': $type,
        'order': order
      },
      success: function (data) {
        $('#subj1').prop('disabled', false);
        $('#msg1').prop('disabled', false);
        $('#subj1').val('');
        $('#msg1').val('');
        $('#emlsub1').prop('disabled', false);
        if (data == 0)
          toastr.error("<?php echo e($langg->something_wrong); ?>");
        else
          toastr.success("<?php echo e($langg->message_sent); ?>");
        $('.close').click();
      }

    });
    return false;
  });
</script>


<script type="text/javascript">
  $('#confirm-delete').on('show.bs.modal', function (e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
  });
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.front', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>