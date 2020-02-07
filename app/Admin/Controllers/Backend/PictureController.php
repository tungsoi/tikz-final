<?php

namespace App\Admin\Controllers\Backend;

use App\Http\Controllers\Controller;
use Brazzer\Admin\Form;
use Brazzer\Admin\Grid;
use Brazzer\Admin\Layout\Content;
use Brazzer\Admin\Show;
use Brazzer\Admin\Controllers\ModelForm;
use App\Models\Picture;
use Illuminate\Support\Str;
use Brazzer\Admin\Facades\Admin;
use App\Models\Tag;
use App\Models\Category;

class PictureController extends Controller
{
    use ModelForm;

    /**
     * Return page index
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Hình vẽ')
            ->description('Danh sách')
            ->body($this->grid());
    }

    /**
     * Return page edit
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Hình vẽ')
            ->description('Chỉnh sửa')
            ->body(
                $this->form()->edit($id)
            );
    }

    /**
     * Return page create
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Hình vẽ')
            ->description('Tạo mới')
            ->body($this->form());
    }

    /**
     * Build table in page index
     *
     * @return Grid
     */
    protected function grid()
    {
        return Picture::grid(function(Grid $grid)
        {
            $grid->model()->orderBy('id', 'desc');
            $grid->filter(function($filter){
                $filter->expand();
                $filter->disableIdFilter();
                $filter->like('name');
            });
            $grid->avatar('Ảnh đại diện')->display(function () {
                $link = asset($this->avatar);
                return '<img src="'.$link.'" style="width: 146.5px !important; height: 89px !important" class="img img-thumbnail">';
            });

            $grid->title('Tiêu đề');
            $grid->sub_title('Tóm tắt');
            $grid->user_created_at('Người tạo')->display(function ($grid) {
                return $this->userCreated->name ?? null;
            });
            $grid->created_at('Ngày tạo')->display(function ($grid) {
                return date('H:i | d/m/Y', strtotime($this->created_at));
            });

        });
    }

    /**
     * Build form for edit or create
     *
     * @return Form
     */
    public function form()
    {
        return Picture::form(function (Form $form)
        {
            $form->hidden('id', 'ID');
            $form->hidden('user_created_id')->default(Admin::user()->id);
            $form->hidden('slug', 'slug');

            $form->image('avatar', 'Ảnh đại diện');
            $form->text('title', 'Tiêu đề');
            $form->textarea('sub_title', 'Tóm tắt');
            $form->textarea('description', 'Mô tả');
            $form->textarea('code', 'Mã code Tikz');
            $form->multipleFile('images', 'Hình ảnh minh hoạ')->removable();
            $form->multipleSelect('tags', 'Thẻ đính kèm')->options(Tag::all()->pluck('name', 'id'));
            $form->multipleSelect('categories', 'Hình vẽ')->options(Category::all()->pluck('name', 'id'));

            $form->saving (function (Form $form) {
                $form->slug = Str::slug($form->title);
            });

            $form->footer(function ($footer)
            {
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });

            Admin::script($this->script());
        });
    }

    /**
     * Return page detail
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        $picture = Picture::find($id);
        return redirect()->route('pic.detail', $picture->slug);
    }

    /**
     * Build detail contact form
     *
     * @param Integer $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Picture::findOrFail($id));
        $show->id('ID');
        $show->name('Tên');
        $show->code('Slug');
        $show->created_at('Ngày tạo');
        return $show;
    }


    public function script()
    {
        return <<<EOT
        $(document).ready(function() {
            $('textarea[name="code"]').summernote({
                height: 300
            });
            $('textarea[name="description"]').summernote({
                height: 300
            });

            $('textarea[name="code"]').summernote('fontName', 'Tahoma');
            $('textarea[name="description"]').summernote('fontName', 'Tahoma');
            $('textarea[name="code"]').summernote('fontColor', 'black');

        });
EOT;

    }
}
